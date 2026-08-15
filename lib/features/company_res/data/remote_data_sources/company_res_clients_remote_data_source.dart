import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/company_res/data/models/client_model.dart';
import 'package:plupool/features/company_res/data/models/create_client_response_model.dart'
    hide ClientModel;
import 'package:plupool/features/company_res/domain/entities/create_client_params.dart';

class CompanyResClientsRemoteDataSource {
  final ApiService apiService;

  CompanyResClientsRemoteDataSource(this.apiService);

  Future<List<ClientModel>> getClients({
    required int userId,
    String? search,
    bool? isActive,
    int page = 1,
    int pageSize = 20,
  }) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    final queryParams = <String, dynamic>{'page': page, 'page_size': pageSize};

    if (search != null && search.isNotEmpty) {
      queryParams['search'] = search;
    }

    if (isActive != null) {
      queryParams['is_active'] = isActive;
    }

    final response = await apiService.get(
      '${Endpoints.users}/$userId/clients',
      queryParams: queryParams,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    return (response.data['clients'] as List)
        .map((e) => ClientModel.fromJson(e))
        .toList();
  }

  Future<void> deleteClient(int userId, int clientId) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    await apiService.delete(
      '${Endpoints.users}/$userId/clients/$clientId',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }

  Future<CreateClientResponseModel> createClient({
    required CreateClientParams params,
  }) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    final response = await apiService.post(
      '${Endpoints.users}/${params.companyRepId}/clients',
      data: {
        'phone': params.phone,
        'country_code': params.countryCode,
        'full_name': params.fullName,
        'address': params.address,
        'is_active': params.isActive,
      },
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    return CreateClientResponseModel.fromJson(response.data);
  }
}
