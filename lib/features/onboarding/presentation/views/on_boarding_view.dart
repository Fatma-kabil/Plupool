import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/onboarding/data/on_boarding_data.dart';
import 'package:plupool/features/onboarding/presentation/views/widgets/on_boarding_controls.dart';
import 'package:plupool/features/onboarding/presentation/views/widgets/on_boarding_indecator.dart';
import 'package:plupool/features/onboarding/presentation/views/widgets/on_boarding_page.dart';
class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  final PageController _controller = PageController();
  int index = 0;

  void _nextPage() {
    if (index < onboardingItems.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    } else {
      // اذهب للصفحة التالية بعد الـ Onboarding
    }
  }

  void _skip() {
    // تخطي الـ Onboarding
  }

  @override
  Widget build(BuildContext context) {
     SizeConfig.init(context);
    return Scaffold(
      
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (value) => setState(() => index = value),
              itemCount: onboardingItems.length,
              itemBuilder: (_, i) => OnboardingPage(item: onboardingItems[i]),
            ),
          ),
          OnboardingIndicator(
            length: onboardingItems.length,
            currentIndex: index,
          ),
          OnboardingControls(
            onNext: _nextPage,
            onSkip: _skip,
            
          ),
           SizedBox(height: SizeConfig.h(50)),
        ],
      ),
    );
  }
}
