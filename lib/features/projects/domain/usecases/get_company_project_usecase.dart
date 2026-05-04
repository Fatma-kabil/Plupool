

import 'package:plupool/features/projects/domain/entities/company_project_entity.dart';
import 'package:plupool/features/projects/domain/repos/company_project_repo.dart';

class GetCompanyProjectsUseCase {
  final CompanyProjectsRepository repo;

  GetCompanyProjectsUseCase(this.repo);

  Future<List<CompanyProjectEntity>> call({
    int skip = 0,
    int limit = 50,
    String? status,
  }) {
    return repo.getCompanyProjects(
      skip: skip,
      limit: limit,
      status: status,
    );
  }
}