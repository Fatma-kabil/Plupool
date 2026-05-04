

import 'package:plupool/features/projects/data/date_sources/company_project_remotee_data_source.dart';
import 'package:plupool/features/projects/domain/entities/company_project_entity.dart';
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
}