

import 'package:plupool/features/support/domain/repos/contact_repo.dart';

class UpdateStatusUseCase {
  final ContactRepository repo;

  UpdateStatusUseCase(this.repo);

  Future<void> call(int id, String status) {
    return repo.updateStatus(id, status);
  }
}