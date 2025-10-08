import 'dart:ui';

class AppbarModel {
  final String username;
  final String subtitle;
  final String avatarUrl;
   // لو عايز تغير الأيقونة حسب الحالة
  final VoidCallback? onNotificationTap;
  final VoidCallback? onContactTap;

  AppbarModel({
    required this.username,
    required this.subtitle,
    required this.avatarUrl,
  
    this.onNotificationTap,
    this.onContactTap,
  });
}
