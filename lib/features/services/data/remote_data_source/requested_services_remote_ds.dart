
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';

import '../models/requests_response_model.dart';
import '../models/service_request_model.dart';

class RequestedServicesRemoteDataSource
      {
  final ApiService api;

  RequestedServicesRemoteDataSource(this.api);

  
  Future<RequestsResponseModel> getRequests(
      Map<String, dynamic> query) async {
    final res = await api.get(
      Endpoints.requestedServices,
      queryParams: query,
    );

    return RequestsResponseModel.fromJson(res.data);
  }

  
  Future<ServiceRequestModel> getRequestDetails(int id) async {
    final res =
        await api.get('${Endpoints.requestedServices}/$id');

    return ServiceRequestModel.fromJson(res.data);
  }

  
  Future<void> deleteRequest(int id) async {
    await api.delete('${Endpoints.requestedServices}/$id');
  }

  
  Future<void> updateStatus(int id, String status) async {
    await api.put(
      '${Endpoints.requestedServices}/$id/status',
      data: {"status": status},
    );
  }
}