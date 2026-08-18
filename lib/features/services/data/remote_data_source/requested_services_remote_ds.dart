import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';

import '../models/requests_response_model.dart';
import '../models/service_request_model.dart';

class RequestedServicesRemoteDataSource {
  final ApiService api;

  RequestedServicesRemoteDataSource(this.api);

  Future<RequestsResponseModel> getRequests(Map<String, dynamic> query) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    final res = await api.get(
      Endpoints.requestedServices,
      queryParams: query,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    print('========== REMOTE DATA ==========');
    print(res.data['tab_counts']);
    print('maintenance RAW = ${res.data['tab_counts']['maintenance']}');
    print('construction RAW = ${res.data['tab_counts']['construction']}');
    print('=================================');

    final model = RequestsResponseModel.fromJson(res.data);

    print('========== AFTER MODEL ==========');
    print('maintenance = ${model.tabCounts.maintenance}');
    print('construction = ${model.tabCounts.construction}');
    print('================================');

    return model;
  }

  Future<ServiceRequestModel> getRequestDetails(int id) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');
    final res = await api.get(
      '${Endpoints.requestedServices}/$id',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    return ServiceRequestModel.fromJson(res.data);
  }

  Future<void> deleteRequest(int id) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');
    await api.delete(
      '${Endpoints.requestedServices}/$id',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }

  Future<void> updateStatus(int id, String status) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');
    await api.put(
      '${Endpoints.requestedServices}/$id/status',
      data: {"status": status},
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }
}
