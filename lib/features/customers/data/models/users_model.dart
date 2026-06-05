class UserModel {
  final int id;
  final String phone;
  final String countryCode;
  final String fullName;
  final String? profileImage;
  final String? role;
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
  final double? totalRatings;
  final double? averageRatings;

  UserModel({
    required this.id,
    required this.phone,
    required this.countryCode,
    required this.fullName,
    this.profileImage,
    this.role,
    this.latitude,
    this.longitude,
    this.address,
    this.skills,
    this.yearsOfExperience,
    this.companyName,
    this.totalRatings,
    required this.isPhoneVerified,
    required this.isActive,
    required this.isApproved,
    required this.createdAt,
    this.averageRatings,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      phone: json['phone'] ?? '',
      countryCode: json['country_code'] ?? '',
      fullName: json['full_name'] ?? '',
      profileImage: json['profile_image'],
      role: json['role'],
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      totalRatings: (json['total_ratings'] as num?)?.toDouble(),
     averageRatings: (json['average_rating'] as num?)?.toDouble() ?? 0.0,
      address: json['address'],
      skills: json['skills'],
      yearsOfExperience: (json['years_of_experience'] as num?)?.toInt(),
      companyName: json['company_name'],
      isPhoneVerified: json['is_phone_verified'] ?? false,
      isActive: json['is_active'] ?? false,
      isApproved: json['is_approved'] ?? false,
      createdAt: DateTime.parse(
        json['created_at'] ?? DateTime.now().toString(),
      ),
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
      "total_ratings": totalRatings,
      "average_rating": averageRatings,
    };
  }
}
