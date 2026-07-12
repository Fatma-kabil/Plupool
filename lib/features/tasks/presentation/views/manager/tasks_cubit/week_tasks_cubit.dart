import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/tasks/domain/usecases/get_week_tasks_use_case.dart';
import 'package:plupool/features/tasks/presentation/views/manager/tasks_cubit/tasks_stae.dart';


class WeekTasksCubit extends Cubit<TechnicianTasksState> {
  WeekTasksCubit(this._getWeekTasksUseCase)
      : super(TechnicianTasksInitial());

  final GetWeekTasksUseCase _getWeekTasksUseCase;

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