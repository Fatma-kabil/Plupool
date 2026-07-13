import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/tasks/data/models/water_quality_history_model.dart';
import 'package:plupool/features/tasks/data/remote_data_sources/technician_tasks_remote_data_source.dart';
import 'package:plupool/features/tasks/domain/entities/task_details_entity.dart';
import 'package:plupool/features/tasks/domain/entities/task_entity.dart';
import 'package:plupool/features/tasks/domain/entities/water_quality_history_entity.dart';
import 'package:plupool/features/tasks/domain/repos/technician_tasks_repo.dart';

class TechnicianTasksRepoImpl implements TechnicianTasksRepo {
  final TechnicianTasksRemoteDataSource remoteDataSource;

  TechnicianTasksRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<TaskEntity>>> getTasks({
    String? search,
    List<String>? status,
    List<String>? priorities,
    List<String>? serviceTypes,
    List<String>? locations,
    String? dateFrom,
    String? dateTo,
    bool weekOnly = false,
    int page = 1,
    int pageSize = 20,
  }) async {
    try {
      final tasks = await remoteDataSource.getTasks(
        search: search,
        status: status,
        priorities: priorities,
        serviceTypes: serviceTypes,
        locations: locations,
        dateFrom: dateFrom,
        dateTo: dateTo,
        weekOnly: weekOnly,
        page: page,
        pageSize: pageSize,
      );

      return Right(tasks);
    } catch (e) {
      return Left(mapDioError(e));
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
      return Left(mapDioError(e));
    }
  }

  @override
  Future<Either<Failure, TaskDetailsEntity>> getTaskDetails({
    required int taskId,
  }) async {
    try {
      final result = await remoteDataSource.getTaskDetails(taskId: taskId);

      return Right(result);
    } catch (e) {
      return Left(mapDioError(e));
    }
  }

  @override
  Future<Either<Failure, TaskDetailsEntity>> completeTaskWithReading({
    required int taskId,
    required WaterQualityHistoryEntity request,
  }) async {
    try {
      final result = await remoteDataSource.completeTaskWithReading(
        taskId: taskId,
       request: WaterQualityHistoryModel.fromEntity(request),
      );

      return Right(result);
    } catch (e) {
      return Left(mapDioError(e));
    }
  }
}
