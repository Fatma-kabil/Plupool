import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/projects/data/models/update_project_model.dart';
import 'package:plupool/features/projects/domain/repos/project_repo.dart';

class UpdateProjectUseCase {
  final OurProjectsRepo repo;

  UpdateProjectUseCase(this.repo);

Future<Either<Failure, Unit>> call(
  UpdateProjectRequest request,
) {
  return repo.updateProject(request);
}
}