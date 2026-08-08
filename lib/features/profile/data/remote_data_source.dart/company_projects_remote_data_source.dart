import 'package:dio/dio.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'; import 'package:plupool/core/di/service_locator.dart';
import '../models/company_project_model.dart';

abstract class CompanyResProjectsRemoteDataSource {
  Future<List<CompanyProjectModel>> getCompanyProjects({
    String? status,
    String? search,
    int skip = 0,
    int limit = 20,
  });
}


class CompanyResProjectsRemoteDataSourceImpl implements CompanyResProjectsRemoteDataSource {
  final ApiService apiService;

  CompanyResProjectsRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<CompanyProjectModel>> getCompanyProjects({
    String? status,
    String? search,
    int skip = 0,
    int limit = 20,
  }) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');
    final response = await apiService.get(
       '${Endpoints.baseUrl}/company/projects',
      queryParams: {
        if (status != null && status.isNotEmpty) 'status': status,
        if (search != null && search.isNotEmpty) 'search': search,
        'skip': skip,
        'limit': limit,
      },
      options: Options(
         headers: {
          'Authorization':
              'Bearer $token',
        },
      )
    );

    final List items = response.data['items'] as List;

    return items
        .map((e) => CompanyProjectModel.fromJson(e))
        .toList();
  }
}