import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/tasks/domain/usecases/get_tasks_use_case.dart';
import 'package:plupool/features/tasks/domain/usecases/get_week_tasks_use_case.dart';
import 'package:plupool/features/tasks/presentation/views/manager/tasks_cubit/tasks_stae.dart';

class TechnicianTasksCubit extends Cubit<TechnicianTasksState> {
  TechnicianTasksCubit(this._getTasksUseCase, this._getWeekTasksUseCase)
    : super(TechnicianTasksInitial());

  final GetTasksUseCase _getTasksUseCase;
  final GetWeekTasksUseCase _getWeekTasksUseCase;

  Future<void> getTasks({
    String? search,
    String? status,
    String? dateFrom,
    String? dateTo,
    int page = 1,
    int pageSize = 20,
  }) async {
    emit(GetTasksLoading());

    final result = await _getTasksUseCase(
      search: search,
      status: status,
      dateFrom: dateFrom,
      dateTo: dateTo,
      page: page,
      pageSize: pageSize,
    );

    result.fold(
      (failure) => emit(GetTasksFailure(failure.message)),
      (tasks) => emit(GetTasksSuccess(tasks)),
    );
  }

  Future<void> getWeekTasks({
    String? weekStart,
    String? weekEnd,
    String? search,
    String? status,
    int page = 1,
    int pageSize = 20,
  }) async {
    emit(GetWeekTasksLoading());

    final result = await _getWeekTasksUseCase(
      weekStart: weekStart,
      weekEnd: weekEnd,
      search: search,
      status: status,
      page: page,
      pageSize: pageSize,
    );

    result.fold(
      (failure) => emit(GetWeekTasksFailure(failure.message)),
      (tasks) => emit(GetWeekTasksSuccess(tasks)),
    );
  }
}
