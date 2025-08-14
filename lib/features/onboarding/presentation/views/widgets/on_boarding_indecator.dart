import 'package:flutter/material.dart';
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
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: SizeConfig.w(20),
          height: SizeConfig.w(8),
          decoration: BoxDecoration(
            color: currentIndex == i
                ? const Color(0xFF12A0FF)
                : const Color(0xffE4E4E4),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
