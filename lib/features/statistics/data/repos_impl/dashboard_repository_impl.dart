import 'package:plupool/features/statistics/domain/repos/dashboard_repo.dart';

import '../../domain/entities/admin_statistics_entity.dart';
import '../data_sources/dashboard_remote_data_source.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remoteDataSource;

  DashboardRepositoryImpl(this.remoteDataSource);

  @override
  Future<AdminStatisticsEntity> getStatistics() async {
    return await remoteDataSource.getStatistics();
  }
}