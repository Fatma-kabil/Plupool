import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class DrawerBadge extends StatelessWidget {
  final int count;

  const DrawerBadge({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: SizeConfig.w(8), vertical: SizeConfig.h(4)),
      decoration: BoxDecoration(
        color: const Color(0xffAAD2E7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        count.toString(),
        style: AppTextStyles.styleSemiBold14(context).copyWith(color: Color(0xff0077B6))
      ),
    );
  }
}
