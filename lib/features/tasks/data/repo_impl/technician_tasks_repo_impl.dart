import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/tasks/data/remote_data_sources/technician_tasks_remote_data_source.dart';
import 'package:plupool/features/tasks/domain/entities/task_entity.dart';
import 'package:plupool/features/tasks/domain/repos/technician_tasks_repo.dart';


class TechnicianTasksRepoImpl implements TechnicianTasksRepo {
  final TechnicianTasksRemoteDataSource remoteDataSource;

  TechnicianTasksRepoImpl(this.remoteDataSource);

@override
  Future<Either<Failure, List<TaskEntity>>> getTasks({
    String? search,
    String? status,
    String? dateFrom,
    String? dateTo,
    int page = 1,
    int pageSize = 20,
  }) async {
    try {
      final tasks = await remoteDataSource.getTasks(
        search: search,
        status: status,
        dateFrom: dateFrom,
        dateTo: dateTo,
        page: page,
        pageSize: pageSize,
      );

      return Right(tasks);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> getWeekTasks({
    String? weekStart,
    String? weekEnd,
    String? status,
    String? search,
    int page = 1,
    int pageSize = 20,
  }) async {
    try {
      final tasks = await remoteDataSource.getWeekTasks(
        weekStart: weekStart,
        weekEnd: weekEnd,
        status: status,
        search: search,
        page: page,
        pageSize: pageSize,
      );

      return Right(tasks);
    } catch (e) {
      return Left(mapDioError(e.toString()));
    }
  }
  
}