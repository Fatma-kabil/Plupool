import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/functions/request_status.dart';

class ProgressSection extends StatelessWidget {
  const ProgressSection({
    super.key,
    required this.progress,
    required this.visits, required this.status,
  });

  final int progress; // عدد الزيارات المنفذة
  final int visits; // إجمالي الزيارات المطلوبة
 final RequestStatus status;
  @override
  Widget build(BuildContext context) {
    final progressRatio = visits > 0 ? progress / visits : 0.0;
    final progressPercent = (progressRatio * 100).round();
     final colors = RequestStatusColors.getColors(status);

    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Text(
        toArabicNumbers(  "$progressPercent%"),
          style: AppTextStyles.styleBold14(
            context,
          ).copyWith(color: colors['labelText']),
        ),
        SizedBox(width: SizeConfig.w(4)),
        Text(
          textDirection: TextDirection.rtl,
        toArabicNumbers(  "( $visits/$progress زيارات )"),
          style: AppTextStyles.styleSemiBold12(context).copyWith(color:  colors['progbar']),
        ),
        SizedBox(width: SizeConfig.w(8)),
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
                        if (progress > 0)
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
                        if (progress == 0)
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
      ],
    );
  }
}
