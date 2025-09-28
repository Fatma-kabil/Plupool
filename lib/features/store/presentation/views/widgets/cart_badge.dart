import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';

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
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Text(
        "$count",
        style: AppTextStyles.styleRegular6(context),
      ),
    );
  }
}
