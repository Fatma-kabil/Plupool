class ContactMessageEntity {
  final int id;
  final String title;
  final String type;
  final String name;
  final String email;
  final String phone;
  final String message;
  final String senderRole;
  final int? userId;
  final String status;
  final DateTime createdAt;

  final String? userFullName;
  final String? userPhone;
  final String? userAddress;
  final bool? userIsActive;
  final String? userProfileImage;

  final String? companyName;
  final String? representativeName;

  final String? technicianName;
  final String? technicianSkills;
  final int? technicianYearsOfExperience;

  final String? poolOwnerName;
  final String? poolOwnerAddress;

  final String? roleLabelAr;

  final List<dynamic> attachments;
  final int? bookingId;
final Map<String, dynamic>? visit;

  ContactMessageEntity({
    required this.id,
    required this.title,
    required this.type,
    required this.name,
    required this.email,
    required this.phone,
    required this.message,
    required this.senderRole,
    required this.userId,
    required this.status,
    required this.createdAt,
    required this.userFullName,
    required this.userPhone,
    required this.userAddress,
    required this.userIsActive,
    required this.userProfileImage,
    required this.companyName,
    required this.representativeName,
    required this.technicianName,
    required this.technicianSkills,
    required this.technicianYearsOfExperience,
    required this.poolOwnerName,
    required this.poolOwnerAddress,
    required this.roleLabelAr,
    required this.attachments,
    this.bookingId,
    this.visit
  });
}