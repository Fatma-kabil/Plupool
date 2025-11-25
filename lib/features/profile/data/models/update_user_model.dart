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

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "phone": phone,
      "full_name": fullName,
      "profile_image": profileImage,
      "role": role,
      "latitude": latitude,
      "longitude": longitude,
      "address": address,
      "skills": skills,
      "years_of_experience": yearsOfExperience,
    };
  }
}
