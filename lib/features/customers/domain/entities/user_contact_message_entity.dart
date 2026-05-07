class UserContactMessageEntity {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String message;
  final String status;
  final String senderRole;
  final DateTime createdAt;

  const UserContactMessageEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.message,
    required this.status,
    required this.senderRole,
    required this.createdAt,
  });
}