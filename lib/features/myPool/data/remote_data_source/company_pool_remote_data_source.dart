import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/myPool/data/models/company_pool_model.dart';

abstract class CompanyPoolRemoteDataSource {
  Future getCompanyPools({
    required int clientId,
    String? tab,
    String? bookingType,
    String? status,
    int limit,
  });
}

class CompanyPoolRemoteDataSourceImpl
    implements CompanyPoolRemoteDataSource {
  final ApiService api;

  CompanyPoolRemoteDataSourceImpl(this.api);

  @override
  Future getCompanyPools({
    required int clientId,
    String? tab,
    String? bookingType,
    String? status,
    int limit = 50,
  }) async {
    print({
      'client_id': clientId,
      'tab': tab,
      'booking_type': bookingType,
      'status': status,
      'limit': limit,
    });

    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    final response = await api.get(
      "${Endpoints.baseUrl}/company/pools",
      queryParams: {
        'client_id': clientId,
        if (tab != null) 'tab': tab,
        if (bookingType != null) 'booking_type': bookingType,
        if (status != null) 'status': status,
        'limit': limit,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return CompanyPoolModel.fromJson(response.data);
  }
}