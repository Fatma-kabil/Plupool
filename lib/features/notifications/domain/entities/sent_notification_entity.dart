class SentNotificationEntity {
  final int id;
  final String title;
  final String message;
  final String type;
  final Map<String, dynamic> data;
  final bool isRead;
  final DateTime createdAt;

  const SentNotificationEntity({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.data,
    required this.isRead,
    required this.createdAt,
  });
}