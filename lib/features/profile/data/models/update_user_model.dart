import 'package:dio/dio.dart';

class UpdateUserModel {
  final String? email;
  final String? phone;
  final String? fullName;
  final String? profileImage;
  final String? role;
  final double? latitude;
  final double? longitude;
  final String? address;
  final String? skills;
  final int? yearsOfExperience;

  UpdateUserModel({
    this.email,
    this.phone,
    this.fullName,
    this.profileImage,
    this.role,
    this.latitude,
    this.longitude,
    this.address,
    this.skills,
    this.yearsOfExperience,
  });

  UpdateUserModel copyWith({
    String? email,
    String? phone,
    String? fullName,
    String? profileImage,
    String? role,
    double? latitude,
    double? longitude,
    String? address,
    String? skills,
    int? yearsOfExperience,
  }) {
    return UpdateUserModel(
      email: email ?? this.email,
      phone: phone ?? this.phone,
      fullName: fullName ?? this.fullName,
      profileImage: profileImage ?? this.profileImage,
      role: role ?? this.role,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
      skills: skills ?? this.skills,
      yearsOfExperience:
          yearsOfExperience ?? this.yearsOfExperience,
    );
  }

  Future<FormData> toFormData() async {
    final formData = FormData();

    if (email != null) {
      formData.fields.add(
        MapEntry('email', email!),
      );
    }

    if (phone != null) {
      formData.fields.add(
        MapEntry('phone', phone!),
      );
    }

    if (fullName != null) {
      formData.fields.add(
        MapEntry('full_name', fullName!),
      );
    }

    if (role != null) {
      formData.fields.add(
        MapEntry('role', role!),
      );
    }

    if (latitude != null) {
      formData.fields.add(
        MapEntry('latitude', latitude.toString()),
      );
    }

    if (longitude != null) {
      formData.fields.add(
        MapEntry('longitude', longitude.toString()),
      );
    }

    if (address != null) {
      formData.fields.add(
        MapEntry('address', address!),
      );
    }

    if (skills != null) {
      formData.fields.add(
        MapEntry('skills', skills!),
      );
    }

    if (yearsOfExperience != null) {
      formData.fields.add(
        MapEntry(
          'years_of_experience',
          yearsOfExperience.toString(),
        ),
      );
    }

    // الصورة
    if (profileImage != null && profileImage!.isNotEmpty) {
      formData.files.add(
        MapEntry(
          'profile_image',
          await MultipartFile.fromFile(
            profileImage!,
            filename: profileImage!.split('/').last,
          ),
        ),
      );
    }

    return formData;
  }
}

