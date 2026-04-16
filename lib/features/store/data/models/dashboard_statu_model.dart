import 'package:flutter/material.dart';

class DashboardStatModel {
  final String title;

  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;

  const DashboardStatModel({
    required this.title,

    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
  });
}
