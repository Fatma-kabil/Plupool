import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/projects/data/models/admin_project_model.dart';
import 'package:plupool/features/store/presentation/views/widgets/time_date_row.dart';

class NextVisitAndPools extends StatelessWidget {
  const NextVisitAndPools({super.key, required this.model});


  final AdminProjectModel model;
  @override
  Widget build(BuildContext context) {
    final progressRatio = model.totalPools > 0
        ? model.finshiedPools / model.totalPools
        : 0.0;
    final progressPercent = (progressRatio * 100).round();
    final colors = RequestStatusColors.getColors(model.status);
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
                  ).copyWith(color: Color(0xff777777)),
                ),
                SizedBox(height: SizeConfig.h(4)),
                TimeDateRow(
                  formattedDate: " 2025-10-22 - 11:00 ص",
                  color: AppColors.ktextcolor,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'عدد المسابح',
                  style: AppTextStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: Color(0xff777777)),
                ),
                SizedBox(height: SizeConfig.h(4)),
                Row(
                  children: [
                    Icon(
                      Icons.pool,
                      size: SizeConfig.w(12),
                      color: AppColors.ktextcolor,
                    ),
                    Text(
                      "${model.finshiedPools}/${model.totalPools}",
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
        Text('مستوى التنفيذ',style: AppTextStyles.styleSemiBold13(context).copyWith(color: Color(0xff2B2B2B)),),
        SizedBox(height: SizeConfig.h(8)),
        Row(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final barWidth =
                      progressRatio * constraints.maxWidth; // العرض النسبي
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(SizeConfig.w(10)),
                    child: Stack(
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
                        if (model.finshiedPools > 0)
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
                        if (model.finshiedPools == 0)
                          Positioned(
                            right: 0, // دايرة في بداية الخط
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
              "$progressPercent%",
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
