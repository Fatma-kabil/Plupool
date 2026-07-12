import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/tasks/domain/repos/technician_tasks_repo.dart';

import '../entities/task_entity.dart';

class GetWeekTasksUseCase {
  final TechnicianTasksRepo repository;

  GetWeekTasksUseCase(this.repository);

  Future<Either<Failure, List<TaskEntity>>> call({
    String? weekStart,
    String? weekEnd,
    String? status,
    String? search,
    int page = 1,
    int pageSize = 20,
  }) {
    return repository.getWeekTasks(
      weekStart: weekStart,
      weekEnd: weekEnd,
      status: status,
      search: search,
      page: page,
      pageSize: pageSize,
    );
  }
}