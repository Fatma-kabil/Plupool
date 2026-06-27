import '../../domain/entities/contact_message_entity.dart';

class ContactMessageModel extends ContactMessageEntity {
  ContactMessageModel({
    required super.id,
    required super.title,
    required super.type,
    required super.name,
    required super.email,
    required super.phone,
    required super.message,
    required super.senderRole,
    required super.userId,
    required super.status,
    required super.createdAt,
    required super.userFullName,
    required super.userPhone,
    required super.userAddress,
    required super.userIsActive,
    required super.userProfileImage,
    required super.companyName,
    required super.representativeName,
    required super.technicianName,
    required super.technicianSkills,
    required super.technicianYearsOfExperience,
    required super.poolOwnerName,
    required super.poolOwnerAddress,
    required super.roleLabelAr,
    required super.attachments,
    super.bookingId,
    super.visit
  });

  factory ContactMessageModel.fromJson(Map<String, dynamic> json) {
    return ContactMessageModel(
      id: json['id'],
      title: json['title'] ?? '',
      type: json['type'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      message: json['message'] ?? '',
      senderRole: json['sender_role'] ?? '',
      userId: json['user_id'],
      status: json['status'] ?? '',
      createdAt: DateTime.parse(json['created_at']),

      userFullName: json['user_full_name'],
      userPhone: json['user_phone'],
      userAddress: json['user_address'],
      userIsActive: json['user_is_active'],
      userProfileImage: json['user_profile_image'],

      companyName: json['company_name'],
      representativeName: json['representative_name'],

      technicianName: json['technician_name'],
      technicianSkills: json['technician_skills'],
      technicianYearsOfExperience: json['technician_years_of_experience'],

      poolOwnerName: json['pool_owner_name'],
      poolOwnerAddress: json['pool_owner_address'],

      roleLabelAr: json['role_label_ar'],

      attachments: json['attachments'] ?? [],
      bookingId: json['booking_id'],
       visit: json['visit'] as Map<String, dynamic>?,

    );
  }
}