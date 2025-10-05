import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 2, color: const Color(0xffD4D4D4)),
      ),
      child: Center(
        child: Text(
          'تفاصيل الحجز',
          style: AppTextStyles.styleBold20(context)
              .copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
