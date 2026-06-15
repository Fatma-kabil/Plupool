import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/projects/domain/repos/company_project_repo.dart';

class DeleteProjectUseCase {
  final CompanyProjectsRepository repository;

  DeleteProjectUseCase(this.repository);

  Future<Either<Failure, void>> call(int projectId) {
    return repository.deleteProject(projectId);
  }
}