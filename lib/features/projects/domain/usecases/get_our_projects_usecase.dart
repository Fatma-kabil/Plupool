import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/projects/domain/repos/project_repo.dart';
import '../entities/our_project_entity.dart';

class GetOurProjectsUseCase {
  final OurProjectsRepo repo;

  GetOurProjectsUseCase(this.repo);

  Future<Either<Failure, List<OurProjectEntity>>> call({
    int skip = 0,
    int limit = 50,
    String? status,
     bool? hasPartener,
  }) {
    return repo.getOurProjects(
      skip: skip,
      limit: limit,
      status: status,
      hasPartener: hasPartener
    );
  }
}