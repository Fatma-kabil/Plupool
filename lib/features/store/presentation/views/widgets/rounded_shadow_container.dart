import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';

class RoundedShadowContainer extends StatelessWidget {
  final Widget child;

  const RoundedShadowContainer({
    super.key,
    required this.child, this.ontap,
  });
final void Function()?ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:ontap ,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(1000),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 1),
              blurRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding:  EdgeInsets.all(SizeConfig.w(4) ),
          child: child,
        ),
      ),
    );
  }
}
