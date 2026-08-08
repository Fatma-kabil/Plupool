import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/myPool/data/models/user_services_model.dart';

class UserServiceRemoteDataSource {
  final ApiService apiService;

  UserServiceRemoteDataSource(this.apiService);

  Future<List<UserServiceModel>> getUserServices({
    String? tab,
    String? status,
    String? search,
    int? skip,
    int? limit,
  }) async {
     final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');
    final response = await apiService.get(
      '${Endpoints.baseUrl}/pool-owner/services',
      queryParams: {
        if (tab != null) 'tab': tab,
        if (status != null) 'status': status,
        if (search != null) 'search': search,
        if (skip != null) 'skip': skip,
        if (limit != null) 'limit': limit,
      },
       options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    
    );

    return (response.data['items'] as List)
        .map((e) => UserServiceModel.fromJson(e))
        .toList();
  }
}