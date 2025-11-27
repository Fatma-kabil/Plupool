// widgets/metric_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class MetricCard extends StatelessWidget {
  final String icon;
 final TextStyle? valueTextStyle; // اختياري
  final String value;
  final String label;

  const MetricCard({
    super.key,
    required this.icon,

    required this.value,
    required this.label, this.valueTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //   margin: const EdgeInsets.symmetric(horizontal: 6), // مسافة يمين وشمال
      padding:  EdgeInsets.symmetric(vertical:SizeConfig.h(12) ,),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFCDCDCD), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // السطر العلوي: أيقونة + القيمة الكبيرة
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
               Text(
                value,

                style:valueTextStyle ??  AppTextStyles.styleBold20(
                  context,
                ).copyWith(color: Colors.black),
              ),
               SizedBox(width: SizeConfig.w(4) ),
              SvgPicture.asset(
                icon,

                height: SizeConfig.h(24),
                width: SizeConfig.w(24),
              ),
              
             
            ],
          ),

           SizedBox(height:SizeConfig.h(4) ),

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
