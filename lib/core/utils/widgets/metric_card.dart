// widgets/metric_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class MetricCard extends StatelessWidget {
  final String icon;

  final String value;
  final String label;

  const MetricCard({
    super.key,
    required this.icon,

    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //   margin: const EdgeInsets.symmetric(horizontal: 6), // مسافة يمين وشمال
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFCDCDCD), width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // السطر العلوي: أيقونة + القيمة الكبيرة
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                icon,

                height: SizeConfig.h(24),
                width: SizeConfig.w(24),
              ),
              const SizedBox(width: 4),
              Text(
                value,

                style: AppTextStyles.styleBold20(
                  context,
                ).copyWith(color: Colors.black),
              ),
            ],
          ),

          const SizedBox(height: 4),

          // التسمية تحت (مركزة)
          Text(
            label,
            textAlign: TextAlign.center,
            style: AppTextStyles.styleRegular14(
              context,
            ).copyWith(color: Color(0xff777777)),
          ),
        ],
      ),
    );
  }
}
