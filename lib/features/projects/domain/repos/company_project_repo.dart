import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/projects/domain/entities/company_project_entity.dart';
import 'package:plupool/features/projects/domain/entities/projects_statistics_entity.dart';
import 'package:plupool/features/projects/domain/params/client_project_params.dart';

abstract class CompanyProjectsRepository {
  Future<List<CompanyProjectEntity>> getCompanyProjects({
    int skip,
    int limit,
    String? status,
  });

  Future<ProjectStatisticsEntity> getProjectStatistics();
  
  Future<Either<Failure, List<CompanyProjectEntity>>> getClientProjects({
    required ClientProjectsParams params,
  });

   Future<Either<Failure, void>> deleteProject(int projectId);

  
}
