import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';

import '../entities/task_entity.dart';

abstract class TechnicianTasksRepo {
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