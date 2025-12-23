import 'package:flutter/widgets.dart';

class DashboardItem {
  final int count;
  final String title;
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;

  DashboardItem({
    required this.count,
    required this.title,
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
  });
}
