import 'package:plupool/features/support/domain/entities/contact_entity.dart';

class ContactModel extends ContactEntity {
  final String email;
  final int? userId;

  final String? userFullName;
  final String? userPhone;

  ContactModel({
    required super.id,
    required super.name,
    required super.phone,
    required super.message,
    required super.createdAt,
    required super.senderRole,
    required super.status,
    required super.attachments,
    super.isActive,
    required this.email,
    required this.userId,
    super.imageUrl,
    super.address,
    this.userFullName,
    this.userPhone,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      message: json['message'],
      createdAt: DateTime.parse(json['created_at']),
      senderRole: json['sender_role'],
      status: json['status'],

      email: json['email'],
      userId: json['user_id'],
      attachments: json['attachments'] ?? [],

      userFullName: json['user_full_name'],
      userPhone: json['user_phone'],
      address: json['user_address'],
      isActive: json['user_is_active']?? false,
      imageUrl: json['user_profile_image'],
    );
  }
}
