import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/presentation/views/widgets/time_date_row.dart';

import '../../../../services/domain/entities/user_booking_entity.dart';

class VisitsSection extends StatelessWidget {
  const VisitsSection({super.key, required this.model});

  final UserBookingEntity model;

  @override
  Widget build(BuildContext context) {
    final visitCount = model.visitCount ?? 0;
    final completedVisits = model.completedVisits ?? 0;

    final progressRatio = visitCount > 0 ? completedVisits / visitCount : 0.0;

    final progressPercent = (progressRatio * 100).round();

    final statu = mapApiStatus(model.status);
    final colors = RequestStatusColors.getColors(statu);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'الزيارة القادمة',
                  style: AppTextStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: const Color(0xff777777)),
                ),
                SizedBox(height: SizeConfig.h(4)),
                TimeDateRow(
                  formattedDate:
                      "${model.nextVisitDate ?? ''} - ${model.nextVisitTime ?? ''}",
                  color: AppColors.ktextcolor,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'عدد الزيارات',
                  style: AppTextStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: const Color(0xff777777)),
                ),
                SizedBox(height: SizeConfig.h(4)),
                Row(
                  children: [
                    Icon(
                      Icons.list_rounded,
                      size: SizeConfig.w(12),
                      color: AppColors.ktextcolor,
                    ),
                    Text(
                      toArabicNumbers("  $completedVisits / $visitCount"),
                      style: AppTextStyles.styleRegular13(
                        context,
                      ).copyWith(color: AppColors.ktextcolor),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: SizeConfig.h(12)),

        Text(
          'مستوى التنفيذ',
          style: AppTextStyles.styleSemiBold13(
            context,
          ).copyWith(color: const Color(0xff2B2B2B)),
        ),

        SizedBox(height: SizeConfig.h(8)),

        Row(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final barWidth = progressRatio * constraints.maxWidth;

                  return ClipRRect(
                    borderRadius: BorderRadius.circular(SizeConfig.w(10)),
                    child: Stack(
                      children: [
                        Container(
                          height: SizeConfig.h(8),
                          decoration: BoxDecoration(
                            color: const Color(0xffD4D4D4),
                            borderRadius: BorderRadius.circular(
                              SizeConfig.w(10),
                            ),
                          ),
                        ),

                        if (completedVisits > 0)
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: SizeConfig.h(8),
                              width: barWidth,
                              decoration: BoxDecoration(
                                color: colors['labelText'],
                                borderRadius: BorderRadius.circular(
                                  SizeConfig.w(10),
                                ),
                              ),
                            ),
                          ),

                        if (completedVisits == 0)
                          Positioned(
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Container(
                              width: SizeConfig.w(8),
                              height: SizeConfig.h(12),
                              decoration: BoxDecoration(
                                color: colors['progbar'],
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),

            SizedBox(width: SizeConfig.w(30)),

            Text(
              toArabicNumbers("$progressPercent %"),
              style: AppTextStyles.styleBold14(
                context,
              ).copyWith(color: colors['labelText']),
            ),
          ],
        ),
      ],
    );
  }
}
