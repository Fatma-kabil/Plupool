import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';

import '../entities/company_project_entity.dart';

abstract class CompanyResProjectsRepository {
  Future<Either<Failure, List<CompanyProjectEntity>>> getCompanyProjects({
    String? status,
    String? search,
    int skip = 0,
    int limit = 20,
  });
}