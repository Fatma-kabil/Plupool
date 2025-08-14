import 'package:flutter/material.dart';
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
      padding:  EdgeInsets.symmetric(vertical:SizeConfig.h(30) , horizontal: SizeConfig.w(20)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: onNext,
                child: Text(
                   "التالي",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF12A0FF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              InkWell(
                onTap: onSkip,
                child: const Text(
                  "تخطي",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xffB3B3B3),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
