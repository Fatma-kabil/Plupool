import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/maintenance/data/models/maintenance_booking_model.dart';
import 'package:plupool/features/maintenance/data/models/maintenance_service_model.dart';

abstract class MaintenanceRemoteDataSource {
  Future getMaintenanceService();
  Future bookMaintenance(MaintenanceBookingModel booking);
}

class MaintenanceRemoteDataSourceImpl
    implements MaintenanceRemoteDataSource {
  final ApiService apiService;

  MaintenanceRemoteDataSourceImpl(this.apiService);

  @override
  Future getMaintenanceService() async {
    final response = await apiService.get(
      '${Endpoints.baseUrl}/pool-owner/maintenance-service',
    );

    return MaintenanceServiceModel.fromJson(response.data);
  }

  @override
  Future bookMaintenance(
    MaintenanceBookingModel booking,
  ) async {
    final body = {
      "booking_type": booking.bookingType,
      "booking_date": booking.bookingDate,
      "booking_time": booking.bookingTime,
      "package_id": booking.packageId,
    };

    debugPrint(body.toString());

    // قراءة التوكن للـ booking فقط
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    await apiService.post(
      '${Endpoints.baseUrl}/pool-owner/services',
      options: Options(
        headers: {
         'Authorization': 'Bearer $token',
        },
      ),
      data: booking.toJson(),
    );
  }
}