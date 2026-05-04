

import 'package:plupool/features/projects/domain/entities/company_project_entity.dart';

abstract class CompanyProjectsRepository {
  Future<List<CompanyProjectEntity>> getCompanyProjects({
    int skip,
    int limit,
    String? status,
  });
}