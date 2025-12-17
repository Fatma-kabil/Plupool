class UpdateUserModel {
  final String? email;
  final String? phone;
  final String? fullName;
  final String? profileImage; // هنا بتخزن مسار الصورة لو متوفرة
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
      yearsOfExperience: yearsOfExperience ?? this.yearsOfExperience,
    );
  }

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
