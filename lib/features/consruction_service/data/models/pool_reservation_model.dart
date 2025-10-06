import 'package:flutter/material.dart';

class PoolReservation {
  final String title;
  final DateTime? date;
  final TimeOfDay? time;
  final double width;
  final double tall;
  final double depth;

  const PoolReservation({
    required this.title,
    this.date,
    this.time,
    required this.width,
    required this.tall,
    required this.depth,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date?.toIso8601String(), // null-safe
      'time': time != null ? '${time!.hour}:${time!.minute}' : null,
      'width': width,
      'height': tall,
      'depth': depth,
    };
  }

  factory PoolReservation.fromJson(Map<String, dynamic> json) {
    return PoolReservation(
      title: json['title'] as String,
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      time: json['time'] != null
          ? _parseTime(json['time'])
          : null,
      width: (json['width'] as num).toDouble(),
      tall: (json['height'] as num).toDouble(),
      depth: (json['depth'] as num).toDouble(),
    );
  }

  // دالة صغيرة تساعدك تفكّر time من String
  static TimeOfDay _parseTime(String timeStr) {
    final parts = timeStr.split(':');
    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
  }
}
