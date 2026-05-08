class UserEntity {
  final int id;
  final String phone;
  final String countryCode;
  final String fullName;
  final String? profileImage;
  final String? role;
  final double? latitude;
  final double? longitude;
  final String? address;
  final String? skills;
  final int? yearsOfExperience;
  final String? companyName;
  final bool isPhoneVerified;
  final bool isActive;
  final bool isApproved;
  final DateTime createdAt;
  final double? totalRating;

  const UserEntity({
    required this.id,
    required this.phone,
    required this.countryCode,
    required this.fullName,
    this.profileImage,
     this.role,
    this.latitude,
    this.longitude,
    this.address,
    this.skills,
    this.yearsOfExperience,
    this.companyName,
    required this.isPhoneVerified,
    required this.isActive,
    required this.isApproved,
    required this.createdAt,
     this.totalRating,
  });
}