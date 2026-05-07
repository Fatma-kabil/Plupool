import 'package:plupool/features/customers/domain/repos/admin_domain_rapos.dart';

class DeleteUserUseCase {
  final AdminUsersRepository repo;

  DeleteUserUseCase(this.repo);

  Future<void> call(int id) {
    return repo.deleteUser(id);
  }
}