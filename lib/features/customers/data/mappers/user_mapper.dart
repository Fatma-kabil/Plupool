import 'package:plupool/features/customers/data/models/users_model.dart';
import 'package:plupool/features/customers/domain/entities/user_entity.dart';

extension UserMapper on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      phone: phone,
      countryCode: countryCode,
      fullName: fullName,
      profileImage: profileImage,
      role: role,
      latitude: latitude,
      longitude: longitude,
      address: address,
      skills: skills,
      yearsOfExperience: yearsOfExperience,
      companyName: companyName,
      isPhoneVerified: isPhoneVerified,
      isActive: isActive,
      isApproved: isApproved,
      createdAt: createdAt,
      totalRating: totalRatings,
       averageRating: averageRatings,
    );
  }
}
