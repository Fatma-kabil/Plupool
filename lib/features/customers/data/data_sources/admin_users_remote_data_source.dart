import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';

class AdminUsersRemoteDataSource {
  final ApiService api;

  AdminUsersRemoteDataSource(this.api);

  Future<Map<String, dynamic>> getUsers({
    int page = 1,
    int pageSize = 50,
    String? search,
    String? role,
    bool? isActive,
    bool? isVerified,
    String sortBy = "created_at",
    String sortOrder = "desc",
  }) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    final response = await api.get(
      Endpoints.users,
      queryParams: {
        "page": page,
        "page_size": pageSize,
        "search": search,
        "role": role,
        "is_active": isActive,
        "is_verified": isVerified,
        "sort_by": sortBy,
        "sort_order": sortOrder,
      }..removeWhere((key, value) => value == null),
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> getUserDetails(int id) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    final response = await api.get(
      '${Endpoints.users}/$id',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> addUser(
    Map<String, dynamic> body,
  ) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    final response = await api.post(
      '${Endpoints.users}/',
      data: body,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> updateUser(
    int id,
    Map<String, dynamic> body,
  ) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    body.removeWhere((key, value) => value == null);

    final response = await api.put(
      '${Endpoints.users}/$id',
      data: body,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );

    return response.data;
  }

  Future<void> deleteUser(int id) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    await api.delete(
      '${Endpoints.users}$id',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }
}