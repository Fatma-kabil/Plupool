import 'package:dio/dio.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/packages/data/models/create_package_request.dart';
import 'package:plupool/features/packages/data/models/package_progress_model.dart';
import 'package:plupool/features/packages/data/models/update_package_request.dart';
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

  Future<PackageProgressModel> increaseProgress({
    required int packageId,
    required int bookingId,
  }) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');
    final response = await dio.patch(
      '${Endpoints.packages}$packageId/progress/increase',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      queryParameters: {'booking_id': bookingId},
    );

    return PackageProgressModel.fromJson(response.data);
  }

  Future<PackageProgressModel> decreaseProgress({
    required int packageId,
    required int bookingId,
  }) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');
    final response = await dio.patch(
      '${Endpoints.packages}$packageId/progress/decrease',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      queryParameters: {'booking_id': bookingId},
    );

    return PackageProgressModel.fromJson(response.data);
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

  Future<void> updatePackage({
    required int packageId,
    required UpdatePackageRequest request,
  }) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    await dio.put(
      '${Endpoints.servicesBookings}/$packageId',
      data: request.toJson(),
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }
}
