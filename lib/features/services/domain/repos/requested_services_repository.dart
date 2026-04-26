import '../entities/requests_response_entity.dart';
import '../entities/service_request_entity.dart';

class GetRequestsParams {
  final String? tab;
  final int page;
  final int limit;
  final String? search;
  final String? sortBy;
  final String? status;

  GetRequestsParams({
    this.tab,
    this.page = 1,
    this.limit = 20,
    this.search,
    this.sortBy,
    this.status,
  });

  Map<String, dynamic> toMap() {
    final map = {
      "page": page,
      "limit": limit,
      "sort_by": sortBy,
    };

    if (tab != null) map["tab"] = tab;
    if (search != null) map["search"] = search;
    if (status != null) map["status"] = status;

    return map;
  }
}

abstract class RequestedServicesRepository {
  Future<RequestsResponseEntity> getRequests(GetRequestsParams params);

  Future<ServiceRequestEntity> getRequestDetails(int id);

  Future<void> deleteRequest(int id);

  Future<void> updateStatus(int id, String status);
}