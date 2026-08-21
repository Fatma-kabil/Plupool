import 'package:dartz/dartz.dart';

import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/projects/domain/repos/company_project_repo.dart';

class DecreaseProjectProgressUseCase {
  final CompanyProjectsRepository repository;

  DecreaseProjectProgressUseCase(this.repository);

  Future<Either<Failure, void>> call({
    required int projectId,
    double? step,
  }) {
    return repository.decreaseProjectProgress(
      projectId: projectId,
      step: step,
    );
  }
}