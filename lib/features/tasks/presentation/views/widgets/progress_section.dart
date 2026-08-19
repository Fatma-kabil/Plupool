import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/functions/request_status.dart';

class ProgressSection extends StatelessWidget {
  const ProgressSection({
    super.key,
    required this.progress,
    required this.visits,
    required this.status,
    required this.progressRatio,
  });

  final num progressRatio;
  final int progress; // عدد الزيارات المكتملة
  final int visits; // إجمالي الزيارات
  final RequestStatus status;

  @override
  Widget build(BuildContext context) {
    final colors = RequestStatusColors.getColors(status);

    // ==========================================
    // حساب النسبة من عدد الزيارات
    // ==========================================

    final double progressValue = visits > 0
        ? (progress / visits).clamp(0.0, 1.0)
        : 0.0;

    final int progressPercent =
        (progressValue * 100).round();

    return Row(
      textDirection: TextDirection.rtl,
      children: [
        // ==========================================
        // PERCENTAGE
        // ==========================================

        Text(
          toArabicNumbers("$progressPercent%"),
          style: AppTextStyles.styleBold14(
            context,
          ).copyWith(
            color: colors['labelText'],
          ),
        ),

        SizedBox(
          width: SizeConfig.w(4),
        ),

        // ==========================================
        // VISITS
        // ==========================================

        Text(
          textDirection: TextDirection.rtl,
          toArabicNumbers(
            "( $visits/$progress زيارات )",
          ),
          style: AppTextStyles.styleSemiBold12(
            context,
          ).copyWith(
            color: colors['progbar'],
          ),
        ),

        SizedBox(
          width: SizeConfig.w(8),
        ),

        // ==========================================
        // PROGRESS BAR
        // ==========================================

        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final barWidth =
                  progressValue * constraints.maxWidth;

              return ClipRRect(
                borderRadius: BorderRadius.circular(
                  SizeConfig.w(10),
                ),
                child: Stack(
                  children: [
                    // ==================================
                    // BACKGROUND
                    // ==================================

                    Container(
                      height: SizeConfig.h(8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffD4D4D4),
                        borderRadius: BorderRadius.circular(
                          SizeConfig.w(10),
                        ),
                      ),
                    ),

                    // ==================================
                    // COLORED PROGRESS
                    // ==================================

                    if (progressValue > 0)
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

                    // ==================================
                    // ZERO PROGRESS
                    // ==================================

                    if (progress == 0)
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

        SizedBox(
          width: SizeConfig.w(12),
        ),
      ],
    );
  }
}