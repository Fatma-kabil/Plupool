import 'package:dio/dio.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/packages/data/models/create_package_request.dart';
import '../models/packages_response_model.dart';
import '../models/package_model.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/di/service_locator.dart';

class PackagesRemoteDataSource {
  final Dio dio;

  PackagesRemoteDataSource(this.dio);

  Future<PackagesResponseModel> getPackages({
    String? status,
    String? duration,
    String? search,
    int limit = 200,
  }) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');
    final res = await dio.get(
      Endpoints.packages,
      queryParameters: {
        "status": status,
        "duration": duration,
        "search": search,
        "limit": limit,
      },
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    return PackagesResponseModel.fromJson(res.data);
  }

  Future<PackageModel> getPackage(int id) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');
    final res = await dio.get(
      "${Endpoints.packages}/$id",
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    return PackageModel.fromJson(res.data);
  }

  Future<void> updateProgress({
    required int packageId,
    required int bookingId,
    String? status,
    DateTime? nextDate,
    String? notes,
  }) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');
    final Map<String, dynamic> queryParameters = {"booking_id": bookingId};

    if (status != null) {
      queryParameters["status"] = status;
    }

    if (nextDate != null) {
      queryParameters["next_maintenance_date"] = nextDate.toIso8601String();
    }

    if (notes != null && notes.isNotEmpty) {
      queryParameters["admin_notes"] = notes;
    }

    await dio.patch(
      "${Endpoints.packages}/$packageId/progress",
      queryParameters: queryParameters,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }

  Future<void> addVisit({
    required int packageId,
    required int userId,
    required String date,
    required String time,
    String? notes,
  }) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');
    await dio.post(
      "${Endpoints.packages}/$packageId/visits",
      queryParameters: {
        "user_id": userId,
        "booking_date": date,
        "booking_time": time,
        "admin_notes": notes,
      },
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }

  Future<void> createPackage(CreatePackageRequest request) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');
    await dio.post(
      Endpoints.packages,
      data: request.toJson(),
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }
}
