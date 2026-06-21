import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';

class QtyBtn extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onTap;
  final Color backgroundcolor;
  final Widget? child;

  const QtyBtn({
    super.key,
    required this.icon,
    required this.onTap,
    required this.backgroundcolor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.w(4)),
      decoration: BoxDecoration(
        color: backgroundcolor,
        shape: BoxShape.circle,
      ),
      child: InkWell(
        onTap: onTap,
        child: child ??
            Icon(
              icon,
              size: SizeConfig.isWideScreen
                  ? SizeConfig.w(12)
                  : SizeConfig.w(15),
              color: Colors.white,
            ),
      ),
    );
  }
}