import 'package:plupool/features/select_role/domain/repos/role_repo.dart';

class DeleteSavedRoleUseCase {
  final RoleRepository repository;

  DeleteSavedRoleUseCase(this.repository);

  Future<void> call() async {
    await repository.deleteSavedRole();
  }
}