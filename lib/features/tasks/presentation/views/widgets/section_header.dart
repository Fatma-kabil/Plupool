import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class SectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;

  const SectionHeader({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Container(
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150),
          color: Color(0xffCCE4F0),),
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.w(5)),
            child: Icon(icon, color: Color(0xff2B8EC2),size: SizeConfig.w(20))
          ),
        ),
        SizedBox(width: SizeConfig.w(4)),
        Text(title,style:AppTextStyles.styleBold16(context).copyWith(color: AppColors.ktextcolor))
      ],
    );
  }
}
