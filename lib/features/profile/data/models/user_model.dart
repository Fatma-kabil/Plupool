class UserModel {
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

  UserModel({
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

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      phone: json['phone'],
      fullName: json['full_name'],
      profileImage: json['profile_image'],
      role: json['role'],
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      address: json['address'],
      skills: json['skills'],
      yearsOfExperience: json['years_of_experience'],
      isPhoneVerified: json['is_phone_verified'],
      isActive: json['is_active'],
      isApproved: json['is_approved'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
      'full_name': fullName,
      'profile_image': profileImage,
      'role': role,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'skills': skills,
      'years_of_experience': yearsOfExperience,
      'is_phone_verified': isPhoneVerified,
      'is_active': isActive,
      'is_approved': isApproved,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
