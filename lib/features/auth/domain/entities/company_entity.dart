// lib/features/auth/domain/entities/company_entity.dart
import 'package:equatable/equatable.dart';

class CompanyEntity extends Equatable {
  final String phone;
  final String otpCode;
  final String fullName; // اسم ممثل الشركة
  final String? profileImage;

  const CompanyEntity({
    required this.phone,
    required this.otpCode,
    required this.fullName,
    this.profileImage,
  });

  CompanyEntity copyWith({
    String? phone,
    String? otpCode,
    String? fullName,
    String? profileImage,
  }) {
    return CompanyEntity(
      phone: phone ?? this.phone,
      otpCode: otpCode ?? this.otpCode,
      fullName: fullName ?? this.fullName,
      profileImage: profileImage ?? this.profileImage,
    );
  }

  @override
  List<Object?> get props => [
        phone,
        otpCode,
        fullName,
        profileImage,
      ];
}
