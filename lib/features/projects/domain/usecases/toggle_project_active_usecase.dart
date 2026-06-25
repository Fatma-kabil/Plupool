import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/projects/domain/repos/project_repo.dart';

class ToggleProjectActiveUseCase {
  final OurProjectsRepo repo;

  ToggleProjectActiveUseCase(this.repo);

  Future<Either<Failure, String>> call(int projectId) {
    return repo.toggleProjectActive(projectId);
  }
}