import '../entities/admin_statistics_entity.dart';

abstract class DashboardRepository {
  Future<AdminStatisticsEntity> getStatistics();
}