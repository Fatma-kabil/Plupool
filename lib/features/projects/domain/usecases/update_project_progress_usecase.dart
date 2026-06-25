import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/projects/domain/params/update_project_progress_params.dart';
import 'package:plupool/features/projects/domain/repos/company_project_repo.dart';

class UpdateProjectProgressUseCase {
  final CompanyProjectsRepository repository;

  UpdateProjectProgressUseCase(this.repository);

  Future<Either<Failure, void>> call(
    UpdateProjectProgressParams params,
  ) {
    return repository.updateProjectProgress(params);
  }
}