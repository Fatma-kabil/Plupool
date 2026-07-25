import 'package:dio/dio.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';

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
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxOCIsInJvbGUiOiJjb21wYW55IiwiZXhwIjoxNzg1MDU0NjkxfQ.I2NxvyNr2oO5jUYoHcIVl5bXt_ez3RDxerlMY2u4MU8',
        },
      )
    );

    final List items = response.data['items'] as List;

    return items
        .map((e) => CompanyProjectModel.fromJson(e))
        .toList();
  }
}