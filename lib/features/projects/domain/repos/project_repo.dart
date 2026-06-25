import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/projects/data/models/update_project_model.dart';
import '../entities/our_project_entity.dart';

abstract class OurProjectsRepo {
  Future<Either<Failure, List<OurProjectEntity>>> getOurProjects({
    int skip = 0,
    int limit = 50,
    String? status,
     bool? hasPartener,
  });

   Future<Either<Failure, Unit>> updateProject(
    UpdateProjectRequest request,
  );

   Future<Either<Failure, Unit>> addProject(
    UpdateProjectRequest request,
  );
}