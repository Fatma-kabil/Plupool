// lib/core/network/api_service.dart
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
     Options? options,
  }) async {
    try {
      final response = await dio.get(endpoint, queryParameters: queryParams,  options: options,);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String endpoint, {
    Map<String, dynamic>? data,
    Options? options, // ✅ خليها نوع Dio Options
  }) async {
    try {
      final response = await dio.post(
        endpoint,
        data: data,
        options: options ??
            Options(
              headers: {
                'Content-Type': 'application/json', // ✅ مهم جدًا
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
      final response = await dio.put(endpoint, data: data, options: options,
);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
    String endpoint, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await dio.delete(endpoint, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
