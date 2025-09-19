import 'dart:ui';

class HeaderModel {
  final String username;
  final String subtitle;
  final String avatarUrl;
  final String notificationIcon; // لو عايز تغير الأيقونة حسب الحالة
  final VoidCallback? onNotificationTap;
  final VoidCallback? onContactTap;

  HeaderModel({
    required this.username,
    required this.subtitle,
    required this.avatarUrl,
    this.notificationIcon = "assets/icons/notification.svg",
    this.onNotificationTap,
    this.onContactTap,
  });
}
