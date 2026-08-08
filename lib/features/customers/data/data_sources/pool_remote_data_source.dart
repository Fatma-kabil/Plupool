import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/customers/data/models/user_pool_model.dart';

class PoolRemoteDataSource {
  final ApiService api;

  PoolRemoteDataSource(this.api);

  Future<UserPoolModel> getUserPool(int userId) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    final response = await api.get(
      '${Endpoints.users}/$userId/pool',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return UserPoolModel.fromJson(response.data);
  }

  Future<UserPoolModel> updateUserPool({
    required int userId,
    required Map<String, dynamic> body,
  }) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    final response = await api.patch(
      '${Endpoints.users}/$userId/pool',
      data: body,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );

    return UserPoolModel.fromJson(response.data);
  }
}