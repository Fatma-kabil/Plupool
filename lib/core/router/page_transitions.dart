import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage buildTransitionPage(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // ✅ Slide + Fade Animation
      final slide = Tween<Offset>(
        begin: const Offset(0.05, 0), // تحريك بسيط من اليمين
        end: Offset.zero,
      ).animate(animation);

      final fade = CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      );

      return FadeTransition(
        opacity: fade,
        child: SlideTransition(position: slide, child: child),
      );
    },
  );
}
