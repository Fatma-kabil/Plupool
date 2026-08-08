import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/consruction_service/data/models/construction_booking_model.dart';

class ConstructionRemoteDataSource {
  final ApiService apiService;

  ConstructionRemoteDataSource(this.apiService);

  Future<void> bookConstruction(
    ConstructionBookingModel model,
  ) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    await apiService.post(
      '${Endpoints.baseUrl}/pool-owner/services',
      data: model.toJson(),
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );
  }
}