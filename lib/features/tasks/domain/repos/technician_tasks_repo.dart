import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';

import '../entities/task_entity.dart';

abstract class TechnicianTasksRepo {
 Future<Either<Failure, List<TaskEntity>>> getTasks({
    String? search,
    String? status,
    String? dateFrom,
    String? dateTo,
    int page = 1,
    int pageSize = 20,
  });

  Future<Either<Failure, List<TaskEntity>>> getWeekTasks({
    String? weekStart,
    String? weekEnd,
    String? status,
    String? search,
    int page = 1,
    int pageSize = 20,
  });
}