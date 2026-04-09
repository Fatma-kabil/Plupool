import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/statistics/domain/usecases/get_admin_statistics_usecase.dart';

import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final GetAdminStatisticsUseCase getStatistics;

  DashboardCubit(this.getStatistics) : super(DashboardInitial());

  Future<void> fetchStatistics() async {
    emit(DashboardLoading());

    try {
      final data = await getStatistics();
      emit(DashboardSuccess(data));
    } catch (e) {
      if (e is Failure) {
        emit(DashboardError(e.message));
      } else {
        emit(DashboardError("حدث خطأ غير متوقع"));
      }
    }
  }
}
