import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';

class OnboardingIndicator extends StatelessWidget {
  final int length;
  final int currentIndex;

  const OnboardingIndicator({
    super.key,
    required this.length,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (i) => AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          width: SizeConfig.w(28),
          height: SizeConfig.w(3),
          decoration: BoxDecoration(
            color: currentIndex == i
                ? AppColors.kprimarycolor
                : const Color(0xffD6D6D6),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }
}
