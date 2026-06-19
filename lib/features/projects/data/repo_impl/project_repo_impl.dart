import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/projects/data/date_sources/project_remot_date_source.dart';
import 'package:plupool/features/projects/domain/entities/our_project_entity.dart';
import 'package:plupool/features/projects/domain/repos/project_repo.dart';

class OurProjectsRepoImpl implements OurProjectsRepo {
  final OurProjectsRemoteDataSource remoteDataSource;

  OurProjectsRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<OurProjectEntity>>> getOurProjects({
    int skip = 0,
    int limit = 50,
    String? status,
  }) async {
    try {
      final projects = await remoteDataSource.getOurProjects(
        skip: skip,
        limit: limit,
        status: status,
      );

      return Right(projects);
    } catch (e) {
      return left(mapDioError(e));
    }
  }
}
