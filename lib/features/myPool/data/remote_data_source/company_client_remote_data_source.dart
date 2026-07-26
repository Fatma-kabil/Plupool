import 'package:dio/dio.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/myPool/data/models/clients_response_model.dart';

abstract class CompanyClientRemoteDataSource {
  Future<ClientsResponseModel> getClients({
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
  Future<ClientsResponseModel> getClients({
    String? search,
    bool? isActive,
    int skip = 0,
    int limit = 20,
  }) async {
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
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxOCIsInJvbGUiOiJjb21wYW55IiwiZXhwIjoxNzg1Njc4Njc5fQ.ko2V_WPMshnbRo6dZeLdlXH-RRSiaMBq7SgsRu9InJw',
        },
        
      ),
      
    );

    return ClientsResponseModel.fromJson(response.data);
  }
}
