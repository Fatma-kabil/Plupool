import 'package:flutter/material.dart';

class PoolReservation {
  final DateTime date;
  final TimeOfDay time;
  final double width;
  final double height;
  final double depth;

  const PoolReservation({
    required this.date,
    required this.time,
    required this.width,
    required this.height,
    required this.depth,
  });

  // ممكن تضيفي دوال مساعدة زي toJson أو fromJson لو هتبعت للسيرفر
  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'time': '${time.hour}:${time.minute}',
      'width': width,
      'height': height,
      'depth': depth,
    };
  }
}
