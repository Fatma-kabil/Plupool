import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/tasks/domain/usecases/get_tasks_use_case.dart';
import 'package:plupool/features/tasks/presentation/views/manager/tasks_cubit/tasks_stae.dart';

class TechnicianTasksCubit extends Cubit<TechnicianTasksState> {
  TechnicianTasksCubit(this._getTasksUseCase) : super(TechnicianTasksInitial());

  final GetTasksUseCase _getTasksUseCase;

  Future<void> getTasks({
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
  }) async {
    emit(GetTasksLoading());

    final result = await _getTasksUseCase(
      search: search,
      status: status,
      priorities: priorities,
      serviceTypes: serviceTypes,
      locations: locations,
      dateFrom: dateFrom,
      dateTo: dateTo,
      weekOnly: weekOnly,
      page: page,
      pageSize: pageSize,
    );

    result.fold(
      (failure) => emit(GetTasksFailure(failure.message)),
      (tasks) => emit(GetTasksSuccess(tasks)),
    );
  }
}
