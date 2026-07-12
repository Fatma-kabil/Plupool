import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/tasks/domain/entities/task_entity.dart';
import 'package:plupool/features/tasks/domain/repos/technician_tasks_repo.dart';


class GetTasksUseCase {
  final TechnicianTasksRepo repository;

  GetTasksUseCase(this.repository);

  Future<Either<Failure, List<TaskEntity>>> call({
    String? search,
    String? status,
    String? dateFrom,
    String? dateTo,
    int page = 1,
    int pageSize = 20,
  }) {
    return repository.getTasks(
      search: search,
      status: status,
      dateFrom: dateFrom,
      dateTo: dateTo,
      page: page,
      pageSize: pageSize,
    );
  }
}