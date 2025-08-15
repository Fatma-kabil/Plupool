import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class OnboardingControls extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onSkip;

  const OnboardingControls({
    super.key,
    required this.onNext,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.h(30),
        horizontal: SizeConfig.w(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: onNext,
                child: Text(
                  "التالي",
                  style: SizeConfig.screenWidth > 800
                      ? AppTextStyles.styleMedium20(
                          context,
                        ).copyWith(fontSize: 28)
                      : AppTextStyles.styleMedium20(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              InkWell(
                onTap: onSkip,
                child: Text(
                  "تخطي",
                  style: SizeConfig.screenWidth > 800
                      ? AppTextStyles.styleMedium20(
                          context,
                        ).copyWith(fontSize: 30, color: Color(0xffB3B3B3))
                      : AppTextStyles.styleMedium20(
                          context,
                        ).copyWith(color: Color(0xffB3B3B3)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
