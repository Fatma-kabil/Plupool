import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/projects/domain/params/client_project_params.dart';
import 'package:plupool/features/projects/domain/usecases/delete_project_usecase.dart';
import 'package:plupool/features/projects/domain/usecases/get_client_project_usecase.dart';
import 'package:plupool/features/projects/domain/usecases/get_company_project_usecase.dart';
import 'package:plupool/features/projects/domain/usecases/get_projects_statistics_usecse.dart';
import 'package:plupool/features/projects/presentation/manager/company_project_cubit/compay_project_state.dart';

class CompanyProjectCubit extends Cubit<CompanyProjectState> {
  final GetCompanyProjectsUseCase useCase;
  final GetProjectStatisticsUseCase statisticsUseCase;
  final GetClientProjectsUseCase getClientProjectsUseCase;
  final DeleteProjectUseCase deleteProjectUseCase;

  CompanyProjectCubit(
    this.useCase,
    this.statisticsUseCase,
    this.getClientProjectsUseCase,
    this.deleteProjectUseCase,
  ) : super(CompanyProjectState());
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

  Future<void> getClientProjects({
    required int clientId,
    String? status,
    int skip = 0,
    int limit = 50,
  }) async {
    emit(state.copyWith(isLoading: true, error: null));

    final result = await getClientProjectsUseCase(
      ClientProjectsParams(
        clientId: clientId,
        statusFilter: status,
        skip: skip,
        limit: limit,
      ),
    );

    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, error: failure.message));
        print(failure);
      },
      (projects) {
        emit(
          state.copyWith(
            isLoading: false,
            clientProjects: projects,
            error: null,
          ),
        );
      },
    );
  }

  Future<void> deleteProject(int projectId) async {
    emit(state.copyWith(isDeleting: true, error: null));

    final result = await deleteProjectUseCase(projectId);

    result.fold(
      (failure) {
        emit(state.copyWith(isDeleting: false, error: failure.message));
        print(failure);
      },
      (_) {
        emit(
          state.copyWith(
            isDeleting: false,
            projects: state.projects
                .where((project) => project.id != projectId)
                .toList(),
          ),
        );
      },
    );
  }

}
