import 'package:plupool/features/select_role/domain/repos/role_repo.dart';

import '../entities/role_entity.dart';

class GetSavedRoleUseCase {
  final RoleRepository repository;
  GetSavedRoleUseCase(this.repository);

  Future<RoleEntity?> call() async {
    return await repository.getSavedRole();
  }
}
