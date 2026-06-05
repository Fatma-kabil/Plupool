import 'package:plupool/features/customers/domain/entities/user_entity.dart';
import 'package:plupool/features/customers/domain/repos/admin_domain_rapos.dart';

class AddUserUsecase {
  final AdminUsersRepository repo;

  AddUserUsecase(this.repo);

  Future<UserEntity> call({
    String? fullName,
    String? phone,
    String? countryCode,
    String? companyName,
    String? role,
    double? latitude,
    double? longitude,
    String? address,
    String? skills,
    int? yearsOfExperience,
    bool? isActive,
    bool? isApproved,
    bool? isPhoneVerified,
  }) {
    return repo.addUser({
      "phone": phone,
      "country_code": countryCode,
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
    });
  }
}
