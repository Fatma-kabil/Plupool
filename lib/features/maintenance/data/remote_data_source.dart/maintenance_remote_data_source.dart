import 'package:dio/dio.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/maintenance/data/models/maintenance_booking_model.dart';
import 'package:plupool/features/maintenance/data/models/maintenance_service_model.dart';

abstract class MaintenanceRemoteDataSource {
  Future<MaintenanceServiceModel> getMaintenanceService();
  Future<void> bookMaintenance(MaintenanceBookingModel booking);
}

class MaintenanceRemoteDataSourceImpl implements MaintenanceRemoteDataSource {
  final ApiService apiService;

  MaintenanceRemoteDataSourceImpl(this.apiService);

  @override
  Future<MaintenanceServiceModel> getMaintenanceService() async {
    final response = await apiService.get(
      '${Endpoints.baseUrl}/pool-owner/maintenance-service',
      options: Options(
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxIiwicm9sZSI6InBvb2xfb3duZXIiLCJleHAiOjE3ODU1OTgzNTh9.mlzkmAfen0LawV5hQKEL7fxAeHJV7juTOf-G2LGHsDo',
        },
      ),
    );

    return MaintenanceServiceModel.fromJson(response.data);
  }

  @override
  Future<void> bookMaintenance(MaintenanceBookingModel booking) async {
    await apiService.post(
      '${Endpoints.baseUrl}/pool-owner/services',
      options: Options(
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxIiwicm9sZSI6InBvb2xfb3duZXIiLCJleHAiOjE3ODU1OTgzNTh9.mlzkmAfen0LawV5hQKEL7fxAeHJV7juTOf-G2LGHsDo',
        },
      ),
      data: booking.toJson(),
    );
  }
}
