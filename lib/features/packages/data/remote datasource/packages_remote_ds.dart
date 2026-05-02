import 'package:dio/dio.dart';
import 'package:plupool/core/network/end_points.dart';
import '../models/packages_response_model.dart';
import '../models/package_model.dart';

class PackagesRemoteDataSource {
  final Dio dio;

  PackagesRemoteDataSource(this.dio);

  Future<PackagesResponseModel> getPackages({
    String? status,
    String? duration,
    String? search,
    int limit = 200,
  }) async {
    final res = await dio.get(
     Endpoints.packages,
      queryParameters: {
        "status": status,
        "duration": duration,
        "search": search,
        "limit": limit,
      },
    );

    return PackagesResponseModel.fromJson(res.data);
  }

  Future<PackageModel> getPackage(int id) async {
    final res = await dio.get("${Endpoints.packages}/$id");
    return PackageModel.fromJson(res.data);
  }

  Future<void> updateProgress({
    required int packageId,
    required int bookingId,
    String? status,
    DateTime? nextDate,
    String? notes,
  }) async {
    await dio.patch(
      "${Endpoints.packages}/$packageId/progress",
      queryParameters: {
        "booking_id": bookingId,
        "status": status,
        "next_maintenance_date": nextDate?.toIso8601String(),
        "admin_notes": notes,
      },
    );
  }

  Future<void> addVisit({
    required int packageId,
    required int userId,
    required String date,
    required String time,
    String? notes,
  }) async {
    await dio.post(
      "${Endpoints.packages}/$packageId/visits",
      queryParameters: {
        "user_id": userId,
        "booking_date": date,
        "booking_time": time,
        "admin_notes": notes,
      },
    );
  }
}