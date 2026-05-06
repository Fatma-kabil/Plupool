class UserModel {
  final int id;
  final String phone;
  final String countryCode;
  final String fullName;
  final String? profileImage;
  final String role;
  final double? latitude;
  final double? longitude;
  final String? address;
  final String? skills;
  final int? yearsOfExperience;
  final String? companyName;
  final bool isPhoneVerified;
  final bool isActive;
  final bool isApproved;
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.phone,
    required this.countryCode,
    required this.fullName,
    this.profileImage,
    required this.role,
    this.latitude,
    this.longitude,
    this.address,
    this.skills,
    this.yearsOfExperience,
    this.companyName,
    required this.isPhoneVerified,
    required this.isActive,
    required this.isApproved,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      phone: json['phone'],
      countryCode: json['country_code'],
      fullName: json['full_name'],
      profileImage: json['profile_image'],
      role: json['role'],
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      address: json['address'],
      skills: json['skills'],
      yearsOfExperience: json['years_of_experience'],
      companyName: json['company_name'],
      isPhoneVerified: json['is_phone_verified'],
      isActive: json['is_active'],
      isApproved: json['is_approved'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "full_name": fullName,
      "company_name": companyName,
      "role": role,
      "latitude": latitude,
      "longitude": longitude,
      "address": address,
      "skills": skills,
      "years_of_experience": yearsOfExperience,
      "is_active": isActive,
      "is_approved": isApproved,
      "is_phone_verified": isPhoneVerified,
    };
  }
}