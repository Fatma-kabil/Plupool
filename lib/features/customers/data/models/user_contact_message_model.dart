class UsersContactMessageModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String message;
  final String status;
  final String senderRole;
  final DateTime createdAt;

  UsersContactMessageModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.message,
    required this.status,
    required this.senderRole,
    required this.createdAt,
  });

  factory UsersContactMessageModel.fromJson(Map<String, dynamic> json) {
    return UsersContactMessageModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      message: json['message'] ?? '',
      status: json['status'] ?? '',
      senderRole: json['sender_role'] ?? '',
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ??
          DateTime.now(),
    );
  }
}