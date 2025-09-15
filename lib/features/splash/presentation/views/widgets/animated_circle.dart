import 'dart:math';
import 'package:flutter/material.dart';
import 'package:plupool/features/splash/presentation/views/widgets/double_wave_pointer.dart';


class AnimatedCircle extends StatelessWidget {
  final AnimationController waveController;
  final Animation<double> fillAnimation;
  final Animation<double> slideAnimation;

  const AnimatedCircle({
    super.key,
    required this.waveController,
    required this.fillAnimation,
    required this.slideAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        waveController,
        fillAnimation,
        slideAnimation,
      ]),
      builder: (context, _) {
        return Transform.translate(
          offset: Offset(slideAnimation.value, 0),
          child: CustomPaint(
            size: const Size(90, 90),
            painter: DoubleWavePainter(
              horizontalPhase: waveController.value * 2 * pi,
              fillPercent: fillAnimation.value,
            ),
          ),
        );
      },
    );
  }
}
