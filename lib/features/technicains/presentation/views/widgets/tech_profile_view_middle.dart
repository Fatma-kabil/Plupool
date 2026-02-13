import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/metric_card.dart';
import 'package:plupool/features/technicains/presentation/views/widgets/edit_rate_card.dart';

class TechProfileViewMiddle extends StatelessWidget {
  const TechProfileViewMiddle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'الإحصائيات والأداء',
              style: AppTextStyles.styleSemiBold16(
                context,
              ).copyWith(color: AppColors.ktextcolor),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      backgroundColor: AppColors.kScaffoldColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      insetPadding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.w(20),
                        vertical: SizeConfig.h(29),
                      ),
                      child: EditRateCard(
                        ratingController: TextEditingController(text: "4.2"),
                      ),
                    );
                  },
                );
              },
              child: Text(
                'تعديل',

                style: AppTextStyles.styleBold16(context).copyWith(
                  color: AppColors.kprimarycolor,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.kprimarycolor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: MetricCard(
                icon: Icons.star_purple500_rounded,
                iconColor: Color(0xffFF9F1C),
                value: "4.8",
                label: 'التقييم',
                valueTextStyle: AppTextStyles.styleBold16(
                  context,
                ).copyWith(color: Color(0xff555555)), // استايل الجست
              ),
            ),

            SizedBox(width: SizeConfig.w(6)),

            Expanded(
              flex: 1,
              child: MetricCard(
                icon: Icons.calendar_view_week,
                iconColor: Color(0xff05B285),
                value: "10",
                label: 'مهام الأسبوع',
                valueTextStyle: AppTextStyles.styleBold16(
                  context,
                ).copyWith(color: Color(0xff555555)), // استايل الجست
              ),
            ),

            SizedBox(width: SizeConfig.w(6)),

            Expanded(
              flex: 1,
              child: MetricCard(
                icon: Icons.task_alt,
                iconColor: Color(0xff00B4D8),
                value: "119",
                valueTextStyle: AppTextStyles.styleBold16(
                  context,
                ).copyWith(color: Color(0xff555555)),

                // استايل الجست
                // استايل الافتراضي داخل MetricCard
                label: 'مهام مكتملة',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
