import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/profile/data/remote_data_source.dart/company_projects_remote_data_source.dart';
import 'package:plupool/features/profile/domain/repos/company_res_projects_repository.dart';

import '../../domain/entities/company_project_entity.dart';

class CompanyRseProjectsRepositoryImpl implements CompanyResProjectsRepository {
  final CompanyResProjectsRemoteDataSource remoteDataSource;

  CompanyRseProjectsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<CompanyProjectEntity>>> getCompanyProjects({
    String? status,
    String? search,
    int skip = 0,
    int limit = 20,
  }) async {
    try {
      final projects = await remoteDataSource.getCompanyProjects(
        status: status,
        search: search,
        skip: skip,
        limit: limit,
      );

      return Right(projects);
    } on DioException catch (e) {
      return Left(mapDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}