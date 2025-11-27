import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/onboarding/data/on_boarding_data.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    //  final isWide = SizeConfig.screenWidth > SizeConfig.screenHeight;
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          item.image,
          fit: BoxFit.fill, // تملى الشاشة
        ),
        Positioned(
          top: SizeConfig.h(505),
          left: 0,
          right: 0,
          child: Text(
            item.title,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: AppTextStyles.styleMedium20(context),
          ),
        ),
      ],
    );
  }
}
