import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/myPool/data/models/pool_info_model.dart';

class PoolInfoRemoteDataSource {
  final ApiService apiService;

  PoolInfoRemoteDataSource(this.apiService);

  Future getPoolInfo() async {
    print("Sending request...");

    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    final response = await apiService.get(
      '${Endpoints.baseUrl}/pool-owner/profile/pool',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return PoolInfoModel.fromJson(response.data);
  }
}