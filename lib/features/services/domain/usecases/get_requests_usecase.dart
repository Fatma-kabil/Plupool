
import 'package:plupool/features/services/domain/repos/requested_services_repository.dart';

import '../entities/requests_response_entity.dart';

class GetRequestsUseCase {
  final RequestedServicesRepository repo;

  GetRequestsUseCase(this.repo);

  Future<RequestsResponseEntity> call(GetRequestsParams params) {
    return repo.getRequests(params);
  }
}