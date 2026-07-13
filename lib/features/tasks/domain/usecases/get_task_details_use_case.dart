import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/tasks/domain/repos/technician_tasks_repo.dart';
import '../entities/task_details_entity.dart';

class GetTaskDetailsUseCase {
  final TechnicianTasksRepo repository;

  GetTaskDetailsUseCase(this.repository);

  Future<Either<Failure, TaskDetailsEntity>> call({
    required int taskId,
  }) {
    return repository.getTaskDetails(
      taskId: taskId,
    );
  }
}