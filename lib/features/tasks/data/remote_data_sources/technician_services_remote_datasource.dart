import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/features/tasks/data/models/technician_services_model.dart';
import 'package:dio/dio.dart';
abstract class TechnicianServicesRemoteDataSource {
  Future<TechnicianServicesModel> getTechnicianServices({
    required int clientId,
    String? status,
  });
}

class TechnicianServicesRemoteDataSourceImpl
    implements TechnicianServicesRemoteDataSource {
  final ApiService apiService;

  TechnicianServicesRemoteDataSourceImpl(this.apiService);

  @override
  Future<TechnicianServicesModel> getTechnicianServices({
    required int clientId,
    String? status,
  }) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    final response = await apiService.get(
      '${Endpoints.baseUrl}/technician/services/$clientId',
      queryParams: {
        'client_id': clientId,
        if (status != null) 'status': status,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return TechnicianServicesModel.fromJson(response.data);
  }
}