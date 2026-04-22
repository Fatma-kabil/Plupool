class ContactEntity {
  final int id;
  final String name;
  final String phone;
  final String message;
  final DateTime createdAt;
  final String senderRole;
  final String status;
  final List attachments;
  final bool? isActive;

  const ContactEntity({
    required this.id,
    required this.name,
    required this.phone,
    required this.message,
    required this.createdAt,
    required this.senderRole,
    required this.status,
    required this.attachments,
    this.isActive
  });
}
