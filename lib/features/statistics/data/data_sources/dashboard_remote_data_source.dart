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
    final response = await api.get(
     Endpoints.adminStatistics
    );

    return AdminStatisticsModel.fromJson(response.data);
  }
}