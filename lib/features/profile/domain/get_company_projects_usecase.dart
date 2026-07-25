import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/profile/domain/entities/company_project_entity.dart';
import 'package:plupool/features/profile/domain/repos/company_res_projects_repository.dart';

class GetCompanyResProjectsUseCase {
  final CompanyResProjectsRepository repository;


  GetCompanyResProjectsUseCase({required this.repository});

  Future<Either<Failure, List<CompanyProjectEntity>>> call({
    String? status,
    String? search,
    int skip = 0,
    int limit = 20,
  }) async {
    return await repository.getCompanyProjects(
      status: status,
      search: search,
      skip: skip,
      limit: limit,
    );
  }
}