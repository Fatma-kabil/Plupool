import 'package:plupool/features/projects/domain/entities/projects_statistics_entity.dart';
import 'package:plupool/features/projects/domain/repos/company_project_repo.dart';

class GetProjectStatisticsUseCase {
  final CompanyProjectsRepository repository;

  GetProjectStatisticsUseCase(this.repository);

  Future<ProjectStatisticsEntity> call() {
    return repository.getProjectStatistics();
  }
}