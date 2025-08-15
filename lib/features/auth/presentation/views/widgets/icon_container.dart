import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({
    super.key,
    required this.iconColor,
    required this.onTap,
  });

  final Color iconColor;
  final VoidCallback onTap; // هنا عرفنا onTap

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(400),
      onTap: onTap,
      child: Container(
        height: SizeConfig.h(24),
        width: SizeConfig.h(24),
        decoration: BoxDecoration(
          color: iconColor,
          borderRadius: BorderRadius.circular(400),
        ),
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: SizeConfig.w(15),
        ),
      ),
    );
  }
}
