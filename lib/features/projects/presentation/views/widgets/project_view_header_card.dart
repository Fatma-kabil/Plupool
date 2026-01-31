import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class ProjectViewHeaderCard extends StatelessWidget {
  final IconData? icon;
  // اختياري
  final String value;
  final Color bkColor;
  final Color iconColor;
  final String label;

  const ProjectViewHeaderCard({
    super.key,
    this.icon,

    required this.value,
    required this.label, required this.bkColor, required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //   margin: const EdgeInsets.symmetric(horizontal: 6), // مسافة يمين وشمال
      padding: EdgeInsets.symmetric(vertical: SizeConfig.h(12)),
      decoration: BoxDecoration(
        color: bkColor,
        borderRadius: BorderRadius.circular(10),
       
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

                style: AppTextStyles.styleBold20(
                  context,
                ).copyWith(color: AppColors.ktextcolor),
              ),
              SizedBox(width: SizeConfig.w(4)),
              Icon(icon ?? Icons.abc, size: SizeConfig.w(22),color: iconColor,),
            ],
          ),

          SizedBox(height: SizeConfig.h(4)),

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
