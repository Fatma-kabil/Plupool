import 'package:plupool/features/select_role/domain/repos/role_repo.dart';

import '../entities/role_entity.dart';


class SaveRoleUseCase {
  final RoleRepository repository;
  SaveRoleUseCase(this.repository);

  Future<void> call(RoleEntity role) async {
    await repository.saveRole(role);
  }
}
