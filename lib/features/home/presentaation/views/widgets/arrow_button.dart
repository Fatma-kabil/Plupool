
import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';

/// زرار السهم
class ArrowButton extends StatelessWidget {
  final IconData icon;
  final bool enabled;
  final VoidCallback onTap;

  const ArrowButton({
    super.key,
    required this.icon,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        height: SizeConfig.w(25),
        width:  SizeConfig.w(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color(0xff2B8EC2),
         
        ),
        child: Icon(
          icon,
          size: SizeConfig.w(17),
          color:  Colors.white,
        ),
      ),
    );
  }
}
