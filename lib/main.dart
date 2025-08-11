// flutter_splash_pro_demo.dart
// Professional SVG splash animations demo (5 variants)
// Place this file in lib/main.dart of a new Flutter project.
// Requirements (pubspec.yaml):
//   flutter_svg: ^2.1.1
//   path_drawing: ^0.5.0
// Assets:
//   assets/images/logo.svg   (your Plupool.svg renamed to logo.svg)
//
// flutter:
//   assets:
//     - assets/images/logo.svg
//
// Then run: flutter pub get && flutter run

import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_drawing/path_drawing.dart';

void main() => runApp(const SplashProDemoApp());

class SplashProDemoApp extends StatelessWidget {
  const SplashProDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Pro Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(
          0xFF12A0FF,
        ), // background color requested
        useMaterial3: true,
      ),
      home: const SelectionScreen(),
    );
  }
}

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      'Fade + Scale (Pro)',
      'Stroke Draw (Pro)',
      'Wave Mask Reveal (Pro)',
      'Rotate + Blur (Pro)',
      'Particles / Light Rays (Pro)',
      'Zoom + Fade from Background (Pro)',
  'Liquid Splash Reveal (Pro)',
  'Glitch Effect (Pro)',
  'Fireworks Burst (Pro)',
  'Shimmer Glow (Pro)',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF12A0FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF12A0FF),
        elevation: 0,
        title: const Text(
          'اختر الانيميشن',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, i) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black87,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AnimationScreen(kind: i)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    items[i],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Icon(Icons.play_arrow),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AnimationScreen extends StatefulWidget {
  final int kind; // 0..4
  const AnimationScreen({super.key, required this.kind});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with TickerProviderStateMixin {
  late final AnimationController _mainCtl;
  late final AnimationController _particleCtl;

  // Path data extracted from the uploaded Plupool.svg (trimmed to one path for stroke animation)
  // If your SVG has multiple paths you can merge them or extract the primary one.
  final String pathData =
      "M1.78077 43C0.952766 42.064 0.538766 40.912 0.538766 39.544C1....83.173 41.65C182.957 42.118 182.651 42.568 182.255 43H170.429Z";

  @override
  void initState() {
    super.initState();
    _mainCtl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _particleCtl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    // Start the main controller
    _mainCtl.forward();
  }

  @override
  void dispose() {
    _mainCtl.dispose();
    _particleCtl.dispose();
    super.dispose();
  }

  Widget _logoSvg({double size = 180}) {
    return SizedBox(
      width: size,
      height: size,
      child: SvgPicture.asset('assets/images/logo.svg'),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    switch (widget.kind) {
      case 0:
        body = FadeScalePro(controller: _mainCtl, child: _logoSvg(size: 190));
        break;
      case 1:
        body = StrokeDrawPro(
          controller: _mainCtl,
          pathData: pathData,
          logo: _logoSvg(size: 220),
        );
        break;
      case 2:
        body = WaveRevealPro(controller: _mainCtl, child: _logoSvg(size: 220));
        break;
      case 3:
        body = RotateBlurPro(controller: _mainCtl, child: _logoSvg(size: 200));
        break;
      case 4:
     
        body = ParticlesPro(
          particleCtl: _particleCtl,
          child: _logoSvg(size: 200),
        );
        break;
        case 5: body = ZoomFadeBgPro(controller: _mainCtl, child: _logoSvg(size: 200)); break;
  case 6: body = LiquidSplashPro(controller: _mainCtl, child: _logoSvg(size: 220)); break;
  case 7: body = GlitchPro(controller: _mainCtl, child: _logoSvg(size: 200)); break;
  case 8: body = FireworksPro(controller: _mainCtl, child: _logoSvg(size: 200)); break;
  case 9: body = ShimmerGlowPro(controller: _mainCtl, child: _logoSvg(size: 200)); break;
  default: body = _logoSvg(size: 200);
    }

    return Scaffold(
      backgroundColor: const Color(0xFF12A0FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF12A0FF),
        elevation: 0,
        title: const Text(
          'معاينة الأنيميشن',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(child: body),
    );
  }
}

// -------------------- 0: Fade + Scale (Pro) --------------------
class FadeScalePro extends StatelessWidget {
  final AnimationController controller;
  final Widget child;
  const FadeScalePro({
    super.key,
    required this.controller,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final scale = TweenSequence([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.8,
          end: 1.15,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 70,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.15,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.elasticOut)),
        weight: 30,
      ),
    ]).animate(controller);
    final opacity = CurvedAnimation(
      parent: controller,
      curve: const Interval(0.0, 0.75, curve: Curves.easeIn),
    );

    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Opacity(
          opacity: opacity.value,
          child: Transform.scale(
            scale: scale.value,
            child: DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.18),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: child,
            ),
          ),
        );
      },
    );
  }
}

// -------------------- 1: Stroke Draw (Pro) --------------------
class StrokeDrawPro extends StatefulWidget {
  final AnimationController controller;
  final String pathData;
  final Widget logo;
  const StrokeDrawPro({
    super.key,
    required this.controller,
    required this.pathData,
    required this.logo,
  });

  @override
  State<StrokeDrawPro> createState() => _StrokeDrawProState();
}

class _StrokeDrawProState extends State<StrokeDrawPro> {
  late Animation<double> _drawAnim;
  late Animation<double> _fillAnim;

  @override
  void initState() {
    super.initState();
    _drawAnim = CurvedAnimation(
      parent: widget.controller,
      curve: const Interval(0.0, 0.75, curve: Curves.easeInOut),
    );

    // Fill after drawing
    _fillAnim = CurvedAnimation(
      parent: widget.controller,
      curve: const Interval(0.75, 1.0, curve: Curves.easeIn),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Filled logo fades in after drawing completes
        FadeTransition(opacity: _fillAnim, child: widget.logo),
        // Stroke painting on canvas
        CustomPaint(
          size: const Size(260, 260),
          painter: _PathStrokePainter(widget.pathData, _drawAnim.value),
        ),
      ],
    );
  }
}

class _PathStrokePainter extends CustomPainter {
  final String pathData;
  final double progress;
  _PathStrokePainter(this.pathData, this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    try {
      final path = parseSvgPathData(pathData);
      final metrics = path.computeMetrics().toList();
      final extracted = Path();
      for (final m in metrics) {
        extracted.addPath(m.extractPath(0, m.length * progress), Offset.zero);
      }

      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 3.0
        ..color = Colors.white;

      // scale to fit a centered box
      final bounds = extracted.getBounds();
      if (bounds.width == 0 || bounds.height == 0) return;
      final scale =
          min(size.width / bounds.width, size.height / bounds.height) * 0.9;
      final matrix = Matrix4.identity()
        ..translate(-bounds.center.dx, -bounds.center.dy)
        ..scale(scale, scale)
        ..translate(size.width / 2, size.height / 2);
      final transformed = extracted.transform(matrix.storage);

      canvas.drawPath(transformed, paint);
    } catch (e) {
      // fallback: nothing
    }
  }

  @override
  bool shouldRepaint(covariant _PathStrokePainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.pathData != pathData;
}

// -------------------- 2: Wave Mask Reveal (Pro) --------------------
class WaveRevealPro extends StatelessWidget {
  final AnimationController controller;
  final Widget child;
  const WaveRevealPro({
    super.key,
    required this.controller,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // We'll animate a linear gradient (moving center) as a shader mask
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final t = controller.value; // 0..1
        final waveCenter = ui.lerpDouble(-300, 300, t)!;
        return ShaderMask(
          blendMode: BlendMode.dstIn,
          shaderCallback: (rect) {
            return ui.Gradient.linear(
              Offset(waveCenter - 120, 0),
              Offset(waveCenter + 120, 0),
              [Colors.transparent, Colors.white, Colors.transparent],
              [0.0, 0.5, 1.0],
            );
          },
          child: child,
        );
      },
    );
  }
}

// -------------------- 3: Rotate + Blur (Pro) --------------------
class RotateBlurPro extends StatelessWidget {
  final AnimationController controller;
  final Widget child;
  const RotateBlurPro({
    super.key,
    required this.controller,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final rot = Tween(
      begin: -0.12,
      end: 0.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    final blur = Tween(
      begin: 8.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Transform.rotate(
          angle: rot.value,
          child: ImageFiltered(
            imageFilter: ui.ImageFilter.blur(
              sigmaX: blur.value,
              sigmaY: blur.value,
            ),
            child: child,
          ),
        );
      },
    );
  }
}

// -------------------- 4: Particles / Light Rays (Pro) --------------------
class ParticlesPro extends StatelessWidget {
  final AnimationController particleCtl;
  final Widget child;
  const ParticlesPro({
    super.key,
    required this.particleCtl,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 340,
          height: 340,
          child: CustomPaint(painter: _ParticlePainter(particleCtl)),
        ),
        child,
      ],
    );
  }
}

class _ParticlePainter extends CustomPainter {
  final Animation<double> animation;
  final Random _rng = Random(42);
  final List<_P> _ps = [];

  _ParticlePainter(this.animation) : super(repaint: animation) {
    for (int i = 0; i < 24; i++) {
      _ps.add(
        _P(
          x: 170 + (_rng.nextDouble() - 0.5) * 140,
          y: 170 + (_rng.nextDouble() - 0.5) * 140,
          r: 1.0 + _rng.nextDouble() * 3,
          speed: 6 + _rng.nextDouble() * 40,
          angle: _rng.nextDouble() * pi * 2,
        ),
      );
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final t = animation.value;
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white.withOpacity(0.4);

    for (var p in _ps) {
      final dx = p.x + cos(p.angle) * (p.speed * t);
      final dy = p.y + sin(p.angle) * (p.speed * t);
      canvas.drawCircle(Offset(dx % size.width, dy % size.height), p.r, paint);
    }

    // subtle light rays rotating
    final center = Offset(size.width / 2, size.height / 2);
    for (int i = 0; i < 6; i++) {
      final angle = (animation.value * 2 * pi) + (i * pi / 3);
      final path = Path()
        ..moveTo(center.dx, center.dy)
        ..lineTo(
          center.dx + cos(angle) * (size.width / 2.6),
          center.dy + sin(angle) * (size.height / 2.6),
        );
      final pPaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.6
        ..color = Colors.white.withOpacity(0.095);
      canvas.drawPath(path, pPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlePainter oldDelegate) =>
      oldDelegate.animation != animation;
}

class _P {
  double x, y, r, speed, angle;
  _P({
    required this.x,
    required this.y,
    required this.r,
    required this.speed,
    required this.angle,
  });
}
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
class LiquidSplashPro extends StatelessWidget {
  final AnimationController controller;
  final Widget child;
  const LiquidSplashPro({super.key, required this.controller, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _LiquidClipper(progress: controller.value),
      child: child,
    );
  }
}

class _LiquidClipper extends CustomClipper<Path> {
  final double progress;
  _LiquidClipper({required this.progress});

  @override
  Path getClip(Size size) {
    final path = Path();
    final waveHeight = 40.0;
    final waveLength = size.width / 1.5;
    final yOffset = size.height * (1 - progress);

    path.moveTo(0, size.height);
    path.lineTo(0, yOffset);

    for (double x = 0; x <= size.width; x++) {
      path.lineTo(
        x,
        yOffset + sin((x / waveLength + progress * 2 * pi)) * waveHeight,
      );
    }

    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant _LiquidClipper oldClipper) =>
      oldClipper.progress != progress;
}
class GlitchPro extends StatelessWidget {
  final AnimationController controller;
  final Widget child;
  const GlitchPro({super.key, required this.controller, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        final t = controller.value;
        final offset = sin(t * 40) * 5;
        return Stack(
          children: [
            Transform.translate(offset: Offset(offset, 0), child: child),
            Transform.translate(
              offset: Offset(-offset, 0),
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcATop),
                child: child,
              ),
            ),
            Transform.translate(
              offset: Offset(offset / 2, 0),
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcATop),
                child: child,
              ),
            ),
          ],
        );
      },
    );
  }
}
class FireworksPro extends StatelessWidget {
  final AnimationController controller;
  final Widget child;
  const FireworksPro({super.key, required this.controller, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: const Size(300, 300),
          painter: _FireworksPainter(controller),
        ),
        child,
      ],
    );
  }
}

class _FireworksPainter extends CustomPainter {
  final Animation<double> animation;
  _FireworksPainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final t = animation.value;
    final paint = Paint()..style = PaintingStyle.fill;

    for (int i = 0; i < 30; i++) {
      final angle = (i / 30) * 2 * pi;
      final radius = t * 120;
      paint.color = Colors.primaries[i % Colors.primaries.length].withOpacity(1 - t);
      final dx = center.dx + cos(angle) * radius;
      final dy = center.dy + sin(angle) * radius;
      canvas.drawCircle(Offset(dx, dy), 4 * (1 - t), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _FireworksPainter oldDelegate) => true;
}
class ShimmerGlowPro extends StatelessWidget {
  final AnimationController controller;
  final Widget child;
  const ShimmerGlowPro({super.key, required this.controller, required this.child});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return ui.Gradient.linear(
          Offset(rect.width * controller.value - rect.width, 0),
          Offset(rect.width * controller.value, rect.height),
          [Colors.transparent, Colors.white, Colors.transparent],
          [0.25, 0.5, 0.75],
        );
      },
      blendMode: BlendMode.srcATop,
      child: child,
    );
  }
}
