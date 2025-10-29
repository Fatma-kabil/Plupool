import 'package:equatable/equatable.dart';
class TechnicianEntity extends Equatable {
  final String phone;
  final String otpCode;
  final String fullName;
  final String? profileImage;
  final double? latitude;
  final double? longitude;
  final String? address;
  final List<String> skills;
  final int yearsOfExperience;

  const TechnicianEntity({
    required this.phone,
    required this.otpCode,
    required this.fullName,
    this.profileImage,
    this.latitude,
    this.longitude,
    this.address,
    this.skills = const [],
    this.yearsOfExperience = 0,
  });

  TechnicianEntity copyWith({
    String? phone,
    String? otpCode,
    String? fullName,
    String? profileImage,
    double? latitude,
    double? longitude,
    String? address,
    List<String>? skills,
    int? yearsOfExperience,
  }) {
    return TechnicianEntity(
      phone: phone ?? this.phone,
      otpCode: otpCode ?? this.otpCode,
      fullName: fullName ?? this.fullName,
      profileImage: profileImage ?? this.profileImage,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
      skills: skills ?? this.skills,
      yearsOfExperience: yearsOfExperience ?? this.yearsOfExperience,
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
        skills,
        yearsOfExperience,
      ];
}
