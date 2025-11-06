// lib/features/auth/data/models/technician_model.dart

import 'package:plupool/features/auth/domain/entities/Sign_up_entities/technician_entity.dart';

class TechnicianModel extends TechnicianEntity {
  const TechnicianModel({
    required super.phone,
    required super.otpCode,
    required super.fullName,
    super.profileImage,
    super.latitude,
    super.longitude,
    super.address,
    super.skills,
    super.yearsOfExperience,
  });

  factory TechnicianModel.fromJson(Map<String, dynamic> json) {
    return TechnicianModel(
      phone: json['phone'] ?? '',
      otpCode: json['otp_code'] ?? '',
      fullName: json['full_name'] ?? '',
      profileImage: json['profile_image'],
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      address: json['address'],
      skills: List<String>.from(json['skills'] ?? []),
      yearsOfExperience: json['years_of_experience'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'otp_code': otpCode,
      'full_name': fullName,
      'profile_image': profileImage ?? '',
      'latitude': latitude ?? 0.0,
      'longitude': longitude ?? 0.0,
      'address': address,
      'skills': skills,
      'years_of_experience': yearsOfExperience,
    };
  }

  factory TechnicianModel.fromEntity(TechnicianEntity entity) {
    return TechnicianModel(
      phone: entity.phone,
      otpCode: entity.otpCode,
      fullName: entity.fullName,
      profileImage: entity.profileImage,
      latitude: entity.latitude,
      longitude: entity.longitude,
      address: entity.address,
      skills: entity.skills,
      yearsOfExperience: entity.yearsOfExperience,
    );
  }
}
