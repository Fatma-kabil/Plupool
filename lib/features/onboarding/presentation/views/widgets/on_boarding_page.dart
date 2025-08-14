import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/onboarding/data/on_boarding_data.dart';


class OnboardingPage extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(item.image, fit: BoxFit.cover),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding:  EdgeInsets.only( bottom:SizeConfig.h(100)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.title,
                   textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style:AppTextStyles.styleBold22(context)
                ),
                const SizedBox(height: 10),
                Text(
                  item.subtitle,
                   textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.styleRegular20(context),
                  
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
