import 'package:plupool/features/auth/domain/entities/Sign_up_entities/company_entity.dart';

class CompanyModel extends CompanyEntity {
  const CompanyModel({
    required super.phone,
    required super.otpCode,
    required super.fullName,
    super.profileImage,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      phone: json['phone'] ?? '',
      otpCode: json['otp_code'] ?? '',
      fullName: json['full_name'] ?? '',
      profileImage: json['profile_image'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = {'phone': phone, 'otp_code': otpCode, 'full_name': fullName};

    if (profileImage != null && profileImage!.isNotEmpty) {
      data['profile_image'] = profileImage!;
    }

    return data;
  }

  factory CompanyModel.fromEntity(CompanyEntity entity) {
    return CompanyModel(
      phone: entity.phone,
      otpCode: entity.otpCode,
      fullName: entity.fullName,
      profileImage: entity.profileImage,
    );
  }
}
