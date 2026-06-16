import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/projects/data/models/company_project_model.dart';
import 'package:plupool/features/projects/domain/entities/company_project_entity.dart';
import 'package:plupool/features/projects/domain/repos/company_project_repo.dart';

class UpdateProjectUseCase {
  final CompanyProjectsRepository repository;

  UpdateProjectUseCase(this.repository);

  Future<Either<Failure, CompanyProjectEntity>> call({
    required int projectId,
    required CompanyProjectModel project,
  }) {
    return repository.updateProject(
      projectId: projectId,
      project: project,
    );
  }
}