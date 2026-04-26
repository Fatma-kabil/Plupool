
import 'package:plupool/features/services/domain/repos/requested_services_repository.dart';

class UpdateRequestStatusUseCase {
  final RequestedServicesRepository repo;

  UpdateRequestStatusUseCase(this.repo);

  Future<void> call(int id, String status) {
    return repo.updateStatus(id, status);
  }
}