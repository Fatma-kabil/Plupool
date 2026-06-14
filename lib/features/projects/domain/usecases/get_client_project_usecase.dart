import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/projects/domain/entities/company_project_entity.dart';
import 'package:plupool/features/projects/domain/params/client_project_params.dart';
import 'package:plupool/features/projects/domain/repos/company_project_repo.dart';

class GetClientProjectsUseCase {
  final CompanyProjectsRepository repo;

  GetClientProjectsUseCase(this.repo);

  Future<Either<Failure, List<CompanyProjectEntity>>> call(
      ClientProjectsParams params) {
    return repo.getClientProjects(
      params: params,
    );
  }
}