import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/projects/domain/usecases/get_company_project_usecase.dart';
import 'package:plupool/features/projects/domain/usecases/get_projects_statistics_usecse.dart';
import 'package:plupool/features/projects/presentation/manager/company_project_cubit/compay_project_state.dart';

class CompanyProjectCubit extends Cubit<CompanyProjectState> {
  final GetCompanyProjectsUseCase useCase;
  final GetProjectStatisticsUseCase statisticsUseCase;

  CompanyProjectCubit(this.useCase, this.statisticsUseCase)
    : super(CompanyProjectState());

  Future<void> getCompanyProjects({
    int skip = 0,
    int limit = 50,
    String? status,
  }) async {
    emit(state.copyWith(isLoading: true));

    try {
      final data = await useCase(skip: skip, limit: limit, status: status);

      emit(state.copyWith(isLoading: false, projects: data, error: null));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: e is Failure ? e.message : "حدث خطأ أثناء جلب المشاريع",
        ),
      );
      print(e);
    }
  }

  Future<void> getProjectStatistics() async {
    emit(state.copyWith(isLoading: true));

    try {
      final data = await statisticsUseCase();

      emit(state.copyWith(isLoading: false, statistics: data));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: e is Failure ? e.message : "حدث خطأ أثناء جلب الإحصائيات",
        ),
      );
    }
  }
}
