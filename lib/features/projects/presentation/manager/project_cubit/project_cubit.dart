import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/projects/data/models/update_project_model.dart';
import 'package:plupool/features/projects/domain/usecases/create_project_usecase.dart';
import 'package:plupool/features/projects/domain/usecases/delete_project_usecase.dart';
import 'package:plupool/features/projects/domain/usecases/get_our_projects_usecase.dart';
import 'package:plupool/features/projects/domain/usecases/toggle_project_active_usecase.dart';
import 'package:plupool/features/projects/domain/usecases/update_project_usecase.dart';
import 'package:plupool/features/projects/presentation/manager/project_cubit/project_state.dart';

class OurProjectsCubit extends Cubit<OurProjectsState> {
  final GetOurProjectsUseCase getOurProjectsUseCase;
  final DeleteProjectUseCase deleteProjectUseCase;
  final UpdateProjectUseCase updateProjectUseCase;
  final AddProjectUseCase addProjectUseCase;
  final ToggleProjectActiveUseCase toggleProjectActiveUseCase;

  OurProjectsCubit(
    this.getOurProjectsUseCase,
    this.deleteProjectUseCase,
    this.updateProjectUseCase,
    this.addProjectUseCase,
    this.toggleProjectActiveUseCase,
  ) : super(const OurProjectsState());

  int _currentSkip = 0;
  int _currentLimit = 50;
  String? _currentStatus;
  bool? _currentHasPartner;

  Future<void> getProjects({
    int skip = 0,
    int limit = 50,
    String? status,
    bool? hasPartener,
  }) async {
    _currentSkip = skip;
    _currentLimit = limit;
    _currentStatus = status;
    _currentHasPartner = hasPartener;

    emit(state.copyWith(isLoading: true, error: null));

    final result = await getOurProjectsUseCase(
      skip: skip,
      limit: limit,
      status: status,
      hasPartener: hasPartener,
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
            projects: projects,
            error: null,
          ),
        );
      },
    );
  }

  Future<void> refreshProjects() async {
    await getProjects(
      skip: _currentSkip,
      limit: _currentLimit,
      status: _currentStatus,
      hasPartener: _currentHasPartner,
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
      (_) async {
        emit(state.copyWith(isDeleting: false));

        await refreshProjects();
      },
    );
  }

  Future<void> updateProject(UpdateProjectRequest request) async {
    emit(state.copyWith(isUpdating: true, updateSuccess: false, error: null));

    final result = await updateProjectUseCase(request);

    result.fold(
      (failure) {
        emit(state.copyWith(isUpdating: false, error: failure.message));
      },
      (_) async {
        emit(state.copyWith(isUpdating: false, updateSuccess: true));

        await refreshProjects();
      },
    );
  }

  Future<void> addProject(UpdateProjectRequest request) async {
    emit(state.copyWith(isAdding: true, addSuccess: false, error: null));

    final result = await addProjectUseCase(request);

    result.fold(
      (failure) {
        emit(state.copyWith(isAdding: false, error: failure.message));
      },
      (_) async {
        emit(state.copyWith(isAdding: false, addSuccess: true));

        await refreshProjects();
      },
    );
  }

  Future<void> toggleProjectActive(int projectId) async {
    emit(state.copyWith(isToggling: true, toggleSuccess: false, error: null));

    final result = await toggleProjectActiveUseCase(projectId);

    result.fold(
      (failure) {
        emit(state.copyWith(isToggling: false, error: failure.message));
      },
      (_) async {
        emit(state.copyWith(isToggling: false, toggleSuccess: true));

        await refreshProjects();
      },
    );
  }
}