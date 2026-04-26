

import 'package:plupool/features/services/domain/repos/requested_services_repository.dart';

class DeleteRequestUseCase {
  final RequestedServicesRepository repo;

  DeleteRequestUseCase(this.repo);

  Future<void> call(int id) {
    return repo.deleteRequest(id);
  }
}