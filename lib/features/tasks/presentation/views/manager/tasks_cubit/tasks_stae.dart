import 'package:plupool/features/tasks/domain/entities/task_details_entity.dart';
import 'package:plupool/features/tasks/domain/entities/task_entity.dart';

abstract class TechnicianTasksState {}

class TechnicianTasksInitial extends TechnicianTasksState {}

/// ---------------- All Tasks ----------------

class GetTasksLoading extends TechnicianTasksState {}

class GetTasksSuccess extends TechnicianTasksState {
  final List<TaskEntity> tasks;

  GetTasksSuccess(this.tasks);
}

class GetTasksFailure extends TechnicianTasksState {
  final String message;

  GetTasksFailure(this.message);
}

/// ---------------- Week Tasks ----------------

class GetWeekTasksLoading extends TechnicianTasksState {}

class GetWeekTasksSuccess extends TechnicianTasksState {
  final List<TaskEntity> tasks;

  GetWeekTasksSuccess(this.tasks);
}

class GetWeekTasksFailure extends TechnicianTasksState {
  final String message;

  GetWeekTasksFailure(this.message);
}

/// ---------------- Task Details ----------------

class GetTaskDetailsLoading extends TechnicianTasksState {}

class GetTaskDetailsSuccess extends TechnicianTasksState {
  final TaskDetailsEntity taskDetails;

  GetTaskDetailsSuccess(this.taskDetails);
}

class GetTaskDetailsFailure extends TechnicianTasksState {
  final String message;

  GetTaskDetailsFailure(this.message);
}