import 'package:flutter/material.dart';
import 'dart:math';
import 'package:plupool/core/utils/size_config.dart';
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
    final double circleSize = SizeConfig.w(SizeConfig.isWideScreen?53: 70); // 45% من عرض الشاشة

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
            size: Size(circleSize, circleSize),
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
