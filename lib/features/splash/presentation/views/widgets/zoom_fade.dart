
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ZoomFadeBgPro extends StatelessWidget {
  final AnimationController controller;
  final Widget child;
  const ZoomFadeBgPro({super.key, required this.controller, required this.child});

  @override
  Widget build(BuildContext context) {
    final scale = Tween(begin: 1.4, end: 1.0)
        .chain(CurveTween(curve: Curves.easeOut))
        .animate(controller);
    final blur = Tween(begin: 12.0, end: 0.0)
        .chain(CurveTween(curve: Curves.easeOut))
        .animate(controller);
    final opacity = Tween(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: Curves.easeIn))
        .animate(controller);

    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Opacity(
          opacity: opacity.value,
          child: ImageFiltered(
            imageFilter: ui.ImageFilter.blur(sigmaX: blur.value, sigmaY: blur.value),
            child: Transform.scale(scale: scale.value, child: child),
          ),
        );
      },
    );
  }
}