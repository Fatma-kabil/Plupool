import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import '../models/admin_statistics_model.dart';

abstract class DashboardRemoteDataSource {
  Future<AdminStatisticsModel> getStatistics();
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
 final ApiService api;

  DashboardRemoteDataSourceImpl(this.api);

  @override
  Future<AdminStatisticsModel> getStatistics() async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');
    final response = await api.get(
      Endpoints.adminStatistics,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    return AdminStatisticsModel.fromJson(response.data);
  }
}