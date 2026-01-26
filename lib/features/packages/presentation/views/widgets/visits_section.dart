import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/packages/data/models/package_model.dart';
import 'package:plupool/features/store/presentation/views/widgets/time_date_row.dart';

class VisitsSection extends StatelessWidget {
  const VisitsSection({super.key, required this.model});
  final PackageModel model;
  @override
  Widget build(BuildContext context) {
    
    final progressRatio =model.totalVisits  > 0 ? model.finshiedVisites / model.totalVisits : 0.0;
    final progressPercent = (progressRatio * 100).round();
     final colors = RequestStatusColors.getColors(model. status);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'الزيارة القادمة',
                  style: AppTextStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: Color(0xff777777)),
                ),
                SizedBox(height: SizeConfig.h(6)),
                TimeDateRow(
                  formattedDate: " 2025-10-22 - 11:00 ص",
                  color: AppColors.ktextcolor,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'الزيارات',
                  style: AppTextStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: Color(0xff777777)),
                ),
                SizedBox(height: SizeConfig.h(6)),
                Icon(
                  Icons.list_rounded,
                  size: SizeConfig.w(12),
                  color: AppColors.ktextcolor,
                ),
                Text(
                  "${model.finishedDate}/${model.finshiedVisites}",
                  style: AppTextStyles.styleRegular13(
                    context,
                  ).copyWith(color: AppColors.ktextcolor),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: SizeConfig.h(8),),
          Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final barWidth =
                  progressRatio * constraints.maxWidth; // العرض النسبي
              return ClipRRect(
                borderRadius: BorderRadius.circular(SizeConfig.w(10)),
                child:
                     Stack(
                      children: [
                        // الخلفية الرمادية
                        Container(
                          height: SizeConfig.h(8),
                          decoration: BoxDecoration(
                            color: const Color(0xffD4D4D4),
                            borderRadius: BorderRadius.circular(
                              SizeConfig.w(10),
                            ),
                          ),
                        ),

                        // الجزء الملوّن يظهر فقط لو progress > 0
                        if (model.finshiedVisites > 0)
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

                        // الدايرة تظهر فقط لو progress == 0
                        if (model.finshiedVisites == 0)
                          Positioned(
                            right: 0, // دايرة في بداية الخط
                            top: 0,
                            bottom:0,
                            child: Container(
                              width:  SizeConfig.w(8),
                              height: SizeConfig.h(12),
                              decoration: BoxDecoration(
                                color: colors['progbar'],
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                      ],
                    )
              );
            },
          ),
        ),

        SizedBox(width: SizeConfig.w(12)),
         Text(
          "$progressPercent%",
          style: AppTextStyles.styleBold13(
            context,
          ).copyWith(color: colors['labelText']),
        ),
      ],
    );
  }
}
