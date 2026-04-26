import 'package:plupool/features/services/data/remote_data_source/requested_services_remote_ds.dart';
import 'package:plupool/features/services/domain/entities/service_request_entity.dart';
import 'package:plupool/features/services/domain/repos/requested_services_repository.dart';

import '../../domain/entities/requests_response_entity.dart';

class RequestedServicesRepositoryImpl
    implements RequestedServicesRepository {
  final RequestedServicesRemoteDataSource remote;

  RequestedServicesRepositoryImpl(this.remote);

  @override
  Future<RequestsResponseEntity> getRequests(params) {
    return remote.getRequests(params.toMap());
  }

  @override
  Future<ServiceRequestEntity> getRequestDetails(int id) {
    return remote.getRequestDetails(id);
  }

  @override
  Future<void> deleteRequest(int id) {
    return remote.deleteRequest(id);
  }

  @override
  Future<void> updateStatus(int id, String status) {
    return remote.updateStatus(id, status);
  }
}