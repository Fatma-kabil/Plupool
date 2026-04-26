
import 'package:plupool/features/services/domain/repos/requested_services_repository.dart';

import '../entities/service_request_entity.dart';

class GetRequestDetailsUseCase {
  final RequestedServicesRepository repo;

  GetRequestDetailsUseCase(this.repo);

  Future<ServiceRequestEntity> call(int id) {
    return repo.getRequestDetails(id);
  }
}