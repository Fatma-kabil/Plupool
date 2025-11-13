import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class ProgressSection extends StatelessWidget {
  const ProgressSection({
    super.key,
    required this.progress,
    required this.visits,
  });

  final int progress; // عدد الزيارات المنفذة
  final int visits; // إجمالي الزيارات المطلوبة

  @override
  Widget build(BuildContext context) {
    final progressRatio = visits > 0 ? progress / visits : 0.0;
    final progressPercent = (progressRatio * 100).round();

    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Text(
          "$progressPercent%",
          style: AppTextStyles.styleSemiBold10(
            context,
          ).copyWith(color: AppColors.kprimarycolor),
        ),
        SizedBox(width: SizeConfig.w(4)),
        Text(
          textDirection: TextDirection.rtl,
          "( $progress/$visits زيارات )",
          style: AppTextStyles.styleSemiBold10(context),
        ),
        SizedBox(width: SizeConfig.w(8)),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final barWidth =
                  progressRatio * constraints.maxWidth; // العرض النسبي
              return ClipRRect(
                borderRadius: BorderRadius.circular(SizeConfig.w(10)),
                child: Stack(
                  children: [
                    Container(
                      height: SizeConfig.h(8), // نفس ارتفاع الخلفية
                      color: Color(0xffD4D4D4), // الخلفية الرمادية
                    ),
                    Align(
                      alignment: Alignment.centerRight, // يبدأ من اليمين
                      child: Container(
                        height: SizeConfig.h(8), // نفس ارتفاع الخلفية
                        width: barWidth, // طول الجزء الملون
                        decoration: BoxDecoration(
                          color: AppColors.kprimarycolor,
                          borderRadius: BorderRadius.circular(SizeConfig.w(10)),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        SizedBox(width: SizeConfig.w(12)),
      ],
    );
  }
}
