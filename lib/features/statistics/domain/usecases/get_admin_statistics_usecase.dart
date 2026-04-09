import 'package:plupool/features/statistics/domain/repos/dashboard_repo.dart';

import '../entities/admin_statistics_entity.dart';

class GetAdminStatisticsUseCase {
  final DashboardRepository repository;

  GetAdminStatisticsUseCase(this.repository);

  Future<AdminStatisticsEntity> call() async {
    return await repository.getStatistics();
  }
}