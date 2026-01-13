
import 'package:flutter/material.dart';

class DashboardShortcutModel {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  const DashboardShortcutModel({
    required this.title,
    required this.icon,
    required this.color,
    this.onTap,
  });
}
