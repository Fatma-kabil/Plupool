class UserEntity {
  final int id;
  final String phone;
  final String fullName;
  final String profileImage;
  final String role;
  final double latitude;
  final double longitude;
  final String address;
  final String skills;
  final int yearsOfExperience;
  final bool isPhoneVerified;
  final bool isActive;
  final bool isApproved;
  final DateTime createdAt;

  UserEntity({
    required this.id,
    required this.phone,
    required this.fullName,
    required this.profileImage,
    required this.role,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.skills,
    required this.yearsOfExperience,
    required this.isPhoneVerified,
    required this.isActive,
    required this.isApproved,
    required this.createdAt,
  });
}
