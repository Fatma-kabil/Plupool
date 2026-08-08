
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  final Dio dio;

  String? token;

  final FlutterSecureStorage storage =
      const FlutterSecureStorage();

  // Dio منفصلة للـ Refresh
  // عشان Request الـ Refresh نفسه ما يدخلش في Loop
  late final Dio refreshDio;

  // تمنع أكتر من Refresh في نفس الوقت
  Completer<bool>? _refreshCompleter;

  ApiService(this.dio) {
    refreshDio = Dio(
      BaseOptions(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: false,
        error: true,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        // ==========================================
        // ERROR
        // ==========================================
        onError: (error, handler) async {
          final statusCode =
              error.response?.statusCode;

          final request =
              error.requestOptions;

          // هل الريكوست ده هو نفسه Refresh؟
          final isRefreshRequest =
              request.path.contains('/auth/refresh');

          // هل الريكوست اتعمله Retry قبل كده؟
          final alreadyRetried =
              request.extra['token_retry'] == true;

          // ==========================================
          // أي Error غير 401
          // أو Refresh نفسه
          // أو الريكوست اتجرب قبل كده
          // ==========================================
          if (statusCode != 401 ||
              isRefreshRequest ||
              alreadyRetried) {
            return handler.next(error);
          }

          // ==========================================
          // حاول نعمل Refresh
          // ==========================================
          final refreshed =
              await _refreshToken();

          // ==========================================
          // Refresh فشل
          // ==========================================
          if (!refreshed) {
            await clearTokens();

            return handler.next(error);
          }

          // ==========================================
          // Access Token الجديد
          // ==========================================
          final newToken =
              await storage.read(
            key: 'token',
          );

          if (newToken == null ||
              newToken.trim().isEmpty) {
            await clearTokens();

            return handler.next(error);
          }

          // تحديث التوكن داخل ApiService
          token = newToken;

          // ==========================================
          // تحديث Authorization في الريكوست القديم
          // ==========================================
          request.headers['Authorization'] =
              'Bearer ${newToken.trim()}';

          // منع Retry أكثر من مرة
          request.extra['token_retry'] = true;

          try {
            // إعادة إرسال الريكوست القديم
            final response =
                await dio.fetch(request);

            return handler.resolve(response);
          } on DioException catch (retryError) {
            return handler.next(retryError);
          }
        },
      ),
    );
  }

  // ==========================================
  // تحديث التوكن بعد Login / Logout
  // ==========================================
  void updateToken(String? newToken) {
    token = newToken;
  }

  // ==========================================
  // Refresh Token
  // ==========================================
  Future<bool> _refreshToken() async {
    // لو فيه Refresh شغال بالفعل
    // باقي الـ requests تستنى نفس العملية
    if (_refreshCompleter != null) {
      return _refreshCompleter!.future;
    }

    final completer = Completer<bool>();

    _refreshCompleter = completer;

    try {
      // قراءة Refresh Token
      final refreshToken =
          await storage.read(
        key: 'refresh_token',
      );

      // مفيش Refresh Token
      if (refreshToken == null ||
          refreshToken.trim().isEmpty) {
        completer.complete(false);
        return false;
      }

      // ==========================================
      // إرسال Refresh Request
      // ==========================================
      final response =
          await refreshDio.post(
        'http://72.60.177.42/api/v1/auth/refresh',
        data: {
          'refresh_token':
              refreshToken.trim(),
        },
      );

      // ==========================================
      // قراءة التوكنات الجديدة
      // ==========================================
      final newAccessToken =
          response.data['access_token']
              as String?;

      final newRefreshToken =
          response.data['refresh_token']
              as String?;

      // Response ناقص
      if (newAccessToken == null ||
          newRefreshToken == null) {
        completer.complete(false);
        return false;
      }

      // ==========================================
      // حفظ Access Token الجديد
      // key = token
      // ==========================================
      await storage.write(
        key: 'token',
        value: newAccessToken,
      );

      // ==========================================
      // حفظ Refresh Token الجديد
      // ==========================================
      await storage.write(
        key: 'refresh_token',
        value: newRefreshToken,
      );

      // تحديث التوكن الموجود داخل ApiService
      token = newAccessToken;

      completer.complete(true);

      return true;
    } on DioException {
      await clearTokens();

      completer.complete(false);

      return false;
    } catch (_) {
      await clearTokens();

      completer.complete(false);

      return false;
    } finally {
      _refreshCompleter = null;
    }
  }

  // ==========================================
  // Clear Tokens
  // ==========================================
  Future<void> clearTokens() async {
    token = null;

    await storage.delete(
      key: 'token',
    );

    await storage.delete(
      key: 'refresh_token',
    );
  }

  // ==========================================
  // GET
  // ==========================================
  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async {
    try {
      final response = await dio.get(
        endpoint,
        queryParameters: queryParams,
        options: options ??
            Options(
              headers: {
                if (token != null)
                  'Authorization':
                      'Bearer $token',
              },
            ),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // ==========================================
  // POST
  // ==========================================
  Future<Response> post(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    dynamic data,
    Options? options,
  }) async {
    try {
      final response = await dio.post(
        endpoint,
        queryParameters: queryParams,
        data: data,
        options: options ??
            Options(
              headers: {
                if (token != null)
                  'Authorization':
                      'Bearer $token',

                'Content-Type':
                    'application/json',
              },
            ),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // ==========================================
  // PUT
  // ==========================================
  Future<Response> put(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async {
    try {
      final response = await dio.put(
        endpoint,
        queryParameters: queryParams,
        data: data,
        options: options ??
            Options(
              headers: {
                if (token != null)
                  'Authorization':
                      'Bearer $token',

                'Content-Type':
                    'application/json',
              },
            ),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // ==========================================
  // PATCH
  // ==========================================
  Future<Response> patch(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async {
    try {
      final response = await dio.patch(
        endpoint,
        data: data,
        queryParameters: queryParams,
        options: options ??
            Options(
              headers: {
                if (token != null)
                  'Authorization':
                      'Bearer $token',

                'Content-Type':
                    'application/json',
              },
            ),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // ==========================================
  // DELETE
  // ==========================================
  Future<Response> delete(
    String endpoint, {
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    try {
      final response = await dio.delete(
        endpoint,
        data: data,
        options: options ??
            Options(
              headers: {
                if (token != null)
                  'Authorization':
                      'Bearer $token',

                'Content-Type':
                    'application/json',
              },
            ),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}