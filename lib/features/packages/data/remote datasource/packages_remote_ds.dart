import 'package:dio/dio.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/packages/data/models/create_package_request.dart';
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
  final Map<String, dynamic> queryParameters = {
    "booking_id": bookingId,
  };

  if (status != null) {
    queryParameters["status"] = status;
  }

  if (nextDate != null) {
    queryParameters["next_maintenance_date"] =
        nextDate.toIso8601String();
  }

  if (notes != null && notes.isNotEmpty) {
    queryParameters["admin_notes"] = notes;
  }

  await dio.patch(
    "${Endpoints.packages}/$packageId/progress",
    queryParameters: queryParameters,
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
  Future<void> createPackage(CreatePackageRequest request) async {
  await dio.post(
    Endpoints.packages,
    data: request.toJson(),
  );
}
}
