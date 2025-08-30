// lib/features/select_role/domain/usecases/select_role.dart
import '../entities/role.dart';
import '../repos/select_role_repo.dart';

class SelectRoleUseCase {
  final SelectRoleRepository repository;
  SelectRoleUseCase(this.repository);

  Future<void> call(Role role) async {
    return await repository.selectRole(role);
  }
}
