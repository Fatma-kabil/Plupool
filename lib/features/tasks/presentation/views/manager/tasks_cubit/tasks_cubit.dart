import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/tasks/domain/entities/task_entity.dart';
import 'package:plupool/features/tasks/domain/entities/water_quality_history_entity.dart';
import 'package:plupool/features/tasks/domain/usecases/complete_task_with_reading_use_case.dart';
import 'package:plupool/features/tasks/domain/usecases/get_task_details_use_case.dart';
import 'package:plupool/features/tasks/domain/usecases/get_tasks_use_case.dart';
import 'package:plupool/features/tasks/presentation/views/manager/tasks_cubit/tasks_stae.dart';

class TechnicianTasksCubit extends Cubit<TechnicianTasksState> {
  TechnicianTasksCubit(
    this._getTasksUseCase,
    this._getTaskDetailsUseCase,
    this._completeTaskWithReadingUseCase,
  ) : super(TechnicianTasksInitial());

  final GetTasksUseCase _getTasksUseCase;
  final GetTaskDetailsUseCase _getTaskDetailsUseCase;
  final CompleteTaskWithReadingUseCase _completeTaskWithReadingUseCase;

  /// ================= Cache =================

  List<TaskEntity> _cachedTasks = [];

  /// آخر بارامترات مستخدمة
  String? _search;
  List<String>? _status;
  List<String>? _priorities;
  List<String>? _serviceTypes;
  List<String>? _locations;
  String? _dateFrom;
  String? _dateTo;
  bool _weekOnly = false;
  int _page = 1;
  int _pageSize = 20;

  /// ================= Get Tasks =================

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
    /// حفظ آخر بارامترات
    _search = search;
    _status = status;
    _priorities = priorities;
    _serviceTypes = serviceTypes;
    _locations = locations;
    _dateFrom = dateFrom;
    _dateTo = dateTo;
    _weekOnly = weekOnly;
    _page = page;
    _pageSize = pageSize;

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
      (tasks) {
        _cachedTasks = tasks;
        emit(GetTasksSuccess(tasks));
      },
    );
  }

  /// ================= Refresh =================

  Future<void> refreshTasks() async {
    await getTasks(
      search: _search,
      status: _status,
      priorities: _priorities,
      serviceTypes: _serviceTypes,
      locations: _locations,
      dateFrom: _dateFrom,
      dateTo: _dateTo,
      weekOnly: _weekOnly,
      page: _page,
      pageSize: _pageSize,
    );
  }

  /// ================= Get Task Details =================

  Future<void> getTaskDetails({
    required int taskId,
  }) async {
    emit(GetTaskDetailsLoading());

    final result = await _getTaskDetailsUseCase(
      taskId: taskId,
    );

    result.fold(
      (failure) => emit(GetTaskDetailsFailure(failure.message)),
      (taskDetails) => emit(GetTaskDetailsSuccess(taskDetails)),
    );
  }

  /// ================= Complete Task =================

  Future<void> completeTaskWithReading({
    required int taskId,
    required WaterQualityHistoryEntity request,
  }) async {
    emit(CompleteTaskWithReadingLoading());

    final result = await _completeTaskWithReadingUseCase(
      taskId: taskId,
      request: request,
    );

    result.fold(
      (failure) => emit(
        CompleteTaskWithReadingFailure(failure.message),
      ),
      (_) async {
        emit(CompleteTaskWithReadingSuccess());

        /// تحديث بيانات صفحة التفاصيل
        await getTaskDetails(taskId: taskId);

        /// تحديث قائمة التاسكات بنفس الفلاتر السابقة
        await refreshTasks();
      },
    );
  }
}