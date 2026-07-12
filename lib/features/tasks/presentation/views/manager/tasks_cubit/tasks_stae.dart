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