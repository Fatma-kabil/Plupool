import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      context.go('/openning');
    }
  }

  void _skip() {
    context.go('/openning');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // الخلفية (الصور مع PageView)
          PageView.builder(
            controller: _controller,
            onPageChanged: (value) => setState(() => index = value),
            itemCount: onboardingItems.length,
            itemBuilder: (_, i) => OnboardingPage(item: onboardingItems[i]),
          ),

          // Overlay للعناصر اللي تحت
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: SizeConfig.h(30)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OnboardingIndicator(
                    length: onboardingItems.length,
                    currentIndex: index,
                  ),
                  const SizedBox(height: 16),
                  OnboardingControls(onNext: _nextPage, onSkip: _skip),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
