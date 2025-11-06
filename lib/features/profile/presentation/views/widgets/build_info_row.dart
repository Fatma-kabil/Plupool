import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class BuildInfoRow extends StatelessWidget {
  const BuildInfoRow({super.key, required this.value, required this.title, required this.icon});
final String value;
final String title;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
      
          style:AppTextStyles.styleMedium16(context).copyWith(color: Color(0xff555555)),
        ),
        const SizedBox(height: 8),
        Padding(
          padding:  EdgeInsets.only(right: SizeConfig.w(8)),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
              textDirection: TextDirection.rtl,
                value,
             
                style:AppTextStyles.styleRegular13(context).copyWith(color:Color(0xff777777))
              ),
              const SizedBox(width: 8),
              Icon(icon, size: SizeConfig.w(14), color: Color(0xff777777)),
            ],
          ),
        ),
      ],
    );
  }
}
