import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/projects/data/date_sources/project_remot_date_source.dart';
import 'package:plupool/features/projects/data/models/update_project_model.dart';
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
    bool? hasPartener,
  }) async {
    try {
      final projects = await remoteDataSource.getOurProjects(
        skip: skip,
        limit: limit,
        status: status,
        hasPartener: hasPartener,
      );

      return Right(projects);
    } catch (e) {
      return left(mapDioError(e));
    }
  }

 
@override
Future<Either<Failure, Unit>> updateProject(
    UpdateProjectRequest request) async {
  try {
    await remoteDataSource.updateProject(request);

    return right(unit);
  } catch (e) {
    return left(mapDioError(e));
  }
}


@override
Future<Either<Failure, Unit>> addProject(
    UpdateProjectRequest request) async {
  try {
    await remoteDataSource.addProject(request);

    return right(unit);
  } catch (e) {
    return left(mapDioError(e));
  }
}

@override
Future<Either<Failure, String>> toggleProjectActive(
  int projectId,
) async {
  try {
    final result =
        await remoteDataSource.toggleProjectActive(projectId);

    return Right(result);
  }  catch (e) {
    return left(mapDioError(e));
  }
}
}
