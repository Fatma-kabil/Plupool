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
