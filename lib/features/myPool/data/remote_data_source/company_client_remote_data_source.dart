import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/myPool/data/models/clients_response_model.dart';

abstract class CompanyClientRemoteDataSource {
  Future getClients({
    String? search,
    bool? isActive,
    int skip = 0,
    int limit = 20,
  });
}

class CompanyClientRemoteDataSourceImpl
    implements CompanyClientRemoteDataSource {
  final ApiService apiService;

  CompanyClientRemoteDataSourceImpl(this.apiService);

  @override
  Future getClients({
    String? search,
    bool? isActive,
    int skip = 0,
    int limit = 20,
  }) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    final response = await apiService.get(
      "${Endpoints.baseUrl}/company/clients",
      queryParams: {
        if (search != null && search.isNotEmpty) "search": search,
        if (isActive != null) "is_active": isActive,
        "skip": skip,
        "limit": limit,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return ClientsResponseModel.fromJson(response.data);
  }
}