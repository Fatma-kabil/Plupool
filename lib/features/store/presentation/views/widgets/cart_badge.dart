import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class CartBadge extends StatelessWidget {
  final int count;
  final Color color;

  const CartBadge({
    super.key,
    required this.count,
    this.color = const Color(0xff06D6A0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(SizeConfig.w(3)),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Center(
        child: Text(
          "$count",
          style: AppTextStyles.styleRegular10(
            context,
          ).copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
