import 'package:dio/dio.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/services/data/models/company_service_model.dart';

abstract class CompanyServiceRemoteDataSource {
  Future<List<CompanyServiceModel>> getMaintenanceServices({
    String? status,
    String? search,
    int? skip,
    int? limit,
  });

  Future<List<CompanyServiceModel>> getServicesPackages({
    String? status,
    String? search,
    int? skip,
    int? limit,
  });
}

class CompanyServiceRemoteDataSourceImpl
    implements CompanyServiceRemoteDataSource {
  final ApiService apiService;

  CompanyServiceRemoteDataSourceImpl(this.apiService);

  @override
  @override
  Future<List<CompanyServiceModel>> getMaintenanceServices({
    String? status,
    String? search,
    int? skip,
    int? limit,
  }) async {
    final queryParams = <String, dynamic>{};

    if (status != null && status.isNotEmpty) {
      queryParams["status"] = status;
    }

    if (search != null && search.isNotEmpty) {
      queryParams["search"] = search;
    }

    if (skip != null) {
      queryParams["skip"] = skip;
    }

    if (limit != null) {
      queryParams["limit"] = limit;
    }

    final response = await apiService.get(
      "${Endpoints.baseUrl}/company/maintenance-services",
      queryParams: queryParams,
      options: Options(
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxOCIsInJvbGUiOiJjb21wYW55IiwiZXhwIjoxNzg1Njc4Njc5fQ.ko2V_WPMshnbRo6dZeLdlXH-RRSiaMBq7SgsRu9InJw',
        },
      ),
    );

    return (response.data["items"] as List)
        .map((e) => CompanyServiceModel.fromJson(e))
        .toList();
  }
@override
Future<List<CompanyServiceModel>> getServicesPackages({
  String? status,
  String? search,
  int? skip,
  int? limit,
}) async {
  final queryParams = <String, dynamic>{};

  if (status != null && status.isNotEmpty) {
    queryParams["status"] = status;
  }

  if (search != null && search.isNotEmpty) {
    queryParams["search"] = search;
  }

  if (skip != null) {
    queryParams["skip"] = skip;
  }

  if (limit != null) {
    queryParams["limit"] = limit;
  }

  final response = await apiService.get(
    "${Endpoints.baseUrl}/company/services-packages",
    queryParams: queryParams,
    options: Options(
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxOCIsInJvbGUiOiJjb21wYW55IiwiZXhwIjoxNzg1Njc4Njc5fQ.ko2V_WPMshnbRo6dZeLdlXH-RRSiaMBq7SgsRu9InJw',
      },
    ),
  );

  return (response.data["items"] as List)
      .map((e) => CompanyServiceModel.fromJson(e))
      .toList();
}
}
