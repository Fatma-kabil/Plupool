// lib/features/auth/domain/entities/pool_owner_entity.dart
import 'package:equatable/equatable.dart';

class PoolOwnerEntity extends Equatable {
  final String phone;
  final String otpCode;
  final String fullName;
  final String? profileImage;
  final double? latitude;
  final double? longitude;
  final String? address;

  const PoolOwnerEntity({
    required this.phone,
    required this.otpCode,
    required this.fullName,
    this.profileImage,
    this.latitude,
    this.longitude,
    this.address,
  });

  PoolOwnerEntity copyWith({
    String? phone,
    String? otpCode,
    String? fullName,
    String? profileImage,
    double? latitude,
    double? longitude,
    String? address,
  }) {
    return PoolOwnerEntity(
      phone: phone ?? this.phone,
      otpCode: otpCode ?? this.otpCode,
      fullName: fullName ?? this.fullName,
      profileImage: profileImage ?? this.profileImage,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
    );
  }

  @override
  List<Object?> get props => [
        phone,
        otpCode,
        fullName,
        profileImage,
        latitude,
        longitude,
        address,
      ];
}
