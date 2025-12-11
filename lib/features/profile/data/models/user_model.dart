import 'package:plupool/features/profile/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required int id,
    required String phone,
    required String fullName,
    required String profileImage,
    required String role,
    required double latitude,
    required double longitude,
    required String address,
    required String skills,
    required int yearsOfExperience,
    required bool isPhoneVerified,
    required bool isActive,
    required bool isApproved,
    required DateTime createdAt,
  }) : super(
          id: id,
          phone: phone,
          fullName: fullName,
          profileImage: profileImage,
          role: role,
          latitude: latitude,
          longitude: longitude,
          address: address,
          skills: skills,
          yearsOfExperience: yearsOfExperience,
          isPhoneVerified: isPhoneVerified,
          isActive: isActive,
          isApproved: isApproved,
          createdAt: createdAt,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      phone: json['phone'] ?? '',
      fullName: json['full_name'] ?? '',
      profileImage: json['profile_image'] ?? '',
      role: json['role'] ?? '',
      latitude: (json['latitude'] ?? 0.0).toDouble(),
      longitude: (json['longitude'] ?? 0.0).toDouble(),
      address: json['address'] ?? '',
      skills: json['skills'] ?? '',
      yearsOfExperience: json['years_of_experience'] ?? 0,
      isPhoneVerified: json['is_phone_verified'] ?? false,
      isActive: json['is_active'] ?? false,
      isApproved: json['is_approved'] ?? false,
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
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

  /// نموذج افتراضي لتجنب null في UI
  factory UserModel.empty() => UserModel(
        id: 0,
        phone: '',
        fullName: '',
        profileImage: '',
        role: '',
        latitude: 0.0,
        longitude: 0.0,
        address: '',
        skills: '',
        yearsOfExperience: 0,
        isPhoneVerified: false,
        isActive: false,
        isApproved: false,
        createdAt: DateTime.now(),
      );
}
