// lib/core/network/api_service.dart
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  String? token; // 🔹 لتخزين التوكن

  ApiService(this.dio);

  /// تحديث التوكن بعد login/logout
  void updateToken(String? newToken) {
    token = newToken;
  }

  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async {
    try {
      final response = await dio.get(
        endpoint,
        queryParameters: queryParams,
        options: options ?? Options(
          headers: {
            if (token != null) 'Authorization': 'Bearer $token',
          },
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String endpoint, {
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    try {
      final response = await dio.post(
        endpoint,
        data: data,
        options: options ?? Options(
          headers: {
            if (token != null) 'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
    String endpoint, {
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    try {
      final response = await dio.put(
        endpoint,
        data: data,
        options: options ?? Options(
          headers: {
            if (token != null) 'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
    String endpoint, {
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    try {
      final response = await dio.delete(
        endpoint,
        data: data,
        options: options ?? Options(
          headers: {
            if (token != null) 'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
