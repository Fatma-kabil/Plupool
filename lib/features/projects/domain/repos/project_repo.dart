import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import '../entities/our_project_entity.dart';

abstract class OurProjectsRepo {
  Future<Either<Failure, List<OurProjectEntity>>> getOurProjects({
    int skip = 0,
    int limit = 50,
    String? status,
  });
}