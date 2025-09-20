import 'dart:ui';

class HeaderModel {
  final String username;
  final String subtitle;
  final String avatarUrl;
   // لو عايز تغير الأيقونة حسب الحالة
  final VoidCallback? onNotificationTap;
  final VoidCallback? onContactTap;

  HeaderModel({
    required this.username,
    required this.subtitle,
    required this.avatarUrl,
  
    this.onNotificationTap,
    this.onContactTap,
  });
}
