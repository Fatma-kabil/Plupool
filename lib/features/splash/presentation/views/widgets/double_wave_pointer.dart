import 'dart:math';
import 'package:flutter/material.dart';

class DoubleWavePainter extends CustomPainter {
  final double horizontalPhase;
  final double fillPercent;

  DoubleWavePainter({
    required this.horizontalPhase,
    required this.fillPercent,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final Offset center = Offset(radius, radius);

    Path circlePath = Path()
      ..addOval(Rect.fromCircle(center: center, radius: radius));

    canvas.save();
    canvas.clipPath(circlePath);

    final double baseY = size.height * (1 - fillPercent);

    _drawWave(
      canvas: canvas,
      size: size,
      baseY: baseY,
      horizontalPhase: -horizontalPhase * 1.2,
      amplitude: size.height * 0.07,
      waveCount: 1,
      color1: const Color(0x8800B4D8),
      color2: const Color(0x8800B4D8),
    );

    _drawWave(
      canvas: canvas,
      size: size,
      baseY: baseY,
      horizontalPhase: horizontalPhase,
      amplitude: size.height * 0.11,
      waveCount: 1,
      color1: const Color(0xff0077B6),
      color2: const Color(0xff0077B6),
    );

    canvas.restore();

    final Paint borderWhite = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.18;

    canvas.drawCircle(center, radius, borderWhite);

    final Paint borderBlue = Paint()
      ..color = const Color(0xff0077B6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.055;

    canvas.drawCircle(center, radius, borderBlue);
  }

  void _drawWave({
    required Canvas canvas,
    required Size size,
    required double baseY,
    required double horizontalPhase,
    required double amplitude,
    required int waveCount,
    required Color color1,
    required Color color2,
  }) {
    final Paint wavePaint = Paint()
      ..shader = LinearGradient(
        colors: [color1, color2],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final Path wavePath = Path();
    wavePath.moveTo(0, size.height);

    for (double x = 0; x <= size.width; x++) {
      final double fx = x / size.width;
      final double y =
          baseY + sin(fx * waveCount * 2 * pi + horizontalPhase) * amplitude;
      wavePath.lineTo(x, y);
    }

    wavePath.lineTo(size.width, size.height);
    wavePath.close();

    canvas.drawPath(wavePath, wavePaint);
  }

  @override
  bool shouldRepaint(covariant DoubleWavePainter oldDelegate) {
    return oldDelegate.horizontalPhase != horizontalPhase ||
        oldDelegate.fillPercent != fillPercent;
  }
}
