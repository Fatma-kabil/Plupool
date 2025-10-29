// lib/features/auth/data/models/pool_owner_model.dart

import 'package:plupool/features/auth/domain/entities/Sign_up_entities/pool_owner_entity.dart';

class PoolOwnerModel extends PoolOwnerEntity {
  const PoolOwnerModel({
    required super.phone,
    required super.otpCode,
    required super.fullName,
    super.profileImage,
    super.latitude,
    super.longitude,
    super.address,
  });

  factory PoolOwnerModel.fromJson(Map<String, dynamic> json) {
    return PoolOwnerModel(
      phone: json['phone'] ?? '',
      otpCode: json['otp_code'] ?? '',
      fullName: json['full_name'] ?? '',
      profileImage: json['profile_image'],
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'otp_code': otpCode,
      'full_name': fullName,
      'profile_image': profileImage,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
    };
  }

  factory PoolOwnerModel.fromEntity(PoolOwnerEntity entity) {
    return PoolOwnerModel(
      phone: entity.phone,
      otpCode: entity.otpCode,
      fullName: entity.fullName,
      profileImage: entity.profileImage,
      latitude: entity.latitude,
      longitude: entity.longitude,
      address: entity.address,
    );
  }
}
