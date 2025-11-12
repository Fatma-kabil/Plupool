import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class MaintenanceItem extends StatelessWidget {
  const MaintenanceItem({
    super.key,
    required this.label,
    required this.value,
    required this.icon, required this.iconcolor,
  });
  final String label;
  final String value;
  final IconData icon;
  final Color iconcolor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: AppTextStyles.styleRegular13(context).copyWith(
          color: Color(0xff777777),
        )),
         SizedBox(height:SizeConfig.h(4) ),
        Row(
          children: [
            Text(
              value,
              style:AppTextStyles.styleBold13(context).copyWith(color: Color(0xff555555)),
            ),
             SizedBox(width: SizeConfig.w(2)),
            Icon(icon, size: SizeConfig.w(18), color: iconcolor),
          ],
        ),
      ],
    );
  }
}
