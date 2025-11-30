import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class WhyUsCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backColor;
  final String title;
  final String subtitle;

  const WhyUsCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.backColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(8),
        vertical: SizeConfig.h(12),
      ),
      decoration: BoxDecoration(
        color: AppColors.kScaffoldColor,

        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.textFieldBorderColor),

        // شادو خط من تحت بس
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: [
          // ===== ICON =====
          Container(
            padding: EdgeInsets.all(SizeConfig.w(8)),
            decoration: BoxDecoration(
              color: backColor,
              borderRadius: BorderRadius.circular(500),
            ),
            child: Icon(icon, color: iconColor, size: SizeConfig.w(18)),
          ),
          SizedBox(width: SizeConfig.w(10)),

          // ===== TEXTS =====
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: AppColors.ktextcolor),
                ),
                SizedBox(height: SizeConfig.h(4)),
                Text(
                  subtitle,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.styleRegular14(
                    context,
                  ).copyWith(color: Color(0xff999999),height: 1.9),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
