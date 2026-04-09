import 'package:flutter/material.dart';

class StatisticsModel {
  final Color iconColor;
  final Color backColor;
  final IconData icon;

  final String title;

  StatisticsModel({ required this.title, 
    required this.iconColor,
    required this.backColor,
    required this.icon,
  });
}
