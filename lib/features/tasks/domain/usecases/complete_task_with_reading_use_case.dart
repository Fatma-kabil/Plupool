import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/tasks/domain/entities/task_details_entity.dart';
import 'package:plupool/features/tasks/domain/entities/water_quality_history_entity.dart';
import 'package:plupool/features/tasks/domain/repos/technician_tasks_repo.dart';

class CompleteTaskWithReadingUseCase {
  final TechnicianTasksRepo repository;

  CompleteTaskWithReadingUseCase(this.repository);

  Future<Either<Failure, TaskDetailsEntity>> call({
    required int taskId,
    required WaterQualityHistoryEntity request,
  }) {
    return repository.completeTaskWithReading(
      taskId: taskId,
      request: request,
    );
  }
}