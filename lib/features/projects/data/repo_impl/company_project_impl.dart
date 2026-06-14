import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/projects/data/date_sources/company_project_remotee_data_source.dart';
import 'package:plupool/features/projects/domain/entities/company_project_entity.dart';
import 'package:plupool/features/projects/domain/entities/projects_statistics_entity.dart';
import 'package:plupool/features/projects/domain/params/client_project_params.dart';
import 'package:plupool/features/projects/domain/repos/company_project_repo.dart';

class CompanyProjectsRepositoryImpl implements CompanyProjectsRepository {
  final CompanyProjectsRemoteDataSourceImpl remote;

  CompanyProjectsRepositoryImpl(this.remote);

  @override
  Future<List<CompanyProjectEntity>> getCompanyProjects({
    int skip = 0,
    int limit = 50,
    String? status,
  }) async {
    return await remote.getCompanyProjects(
      skip: skip,
      limit: limit,
      status: status,
    );
  }

  @override
  Future<ProjectStatisticsEntity> getProjectStatistics() async {
    return await remote.getProjectStatistics();
  }

  @override
 @override
Future<Either<Failure, List<CompanyProjectEntity>>> getClientProjects({
  required ClientProjectsParams params,
}) async {
  try {
    final result = await remote.getClientProjects(params: params);

    return right(result);
  } catch (e) {
    return left(mapDioError(e));
  }
}
}
