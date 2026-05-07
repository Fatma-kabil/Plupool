import 'package:plupool/features/customers/domain/entities/user_details_entity.dart';
import 'package:plupool/features/customers/domain/repos/admin_domain_rapos.dart';

class GetUserDetailsUseCase {
  final AdminUsersRepository repo;

  GetUserDetailsUseCase(this.repo);

  Future<UserDetailsEntity> call(int id) {
    return repo.getUserDetails(id);
  }
}