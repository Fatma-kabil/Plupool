import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/projects/data/models/update_project_model.dart';
import 'package:plupool/features/projects/domain/usecases/delete_project_usecase.dart';
import 'package:plupool/features/projects/domain/usecases/get_our_projects_usecase.dart';
import 'package:plupool/features/projects/domain/usecases/update_project_usecase.dart';
import 'package:plupool/features/projects/presentation/manager/project_cubit/project_state.dart';

class OurProjectsCubit extends Cubit<OurProjectsState> {
  final GetOurProjectsUseCase getOurProjectsUseCase;

  final DeleteProjectUseCase deleteProjectUseCase;
  final UpdateProjectUseCase updateProjectUseCase;

  OurProjectsCubit(
    this.getOurProjectsUseCase,
    this.deleteProjectUseCase,
    this.updateProjectUseCase,
  ) : super(const OurProjectsState());

  Future<void> getProjects({
    int skip = 0,
    int limit = 50,
    String? status,
    bool? hasPartener,
  }) async {
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
        emit(state.copyWith(isLoading: false, projects: projects, error: null));
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

  Future<void> updateProject(UpdateProjectRequest request) async {
    emit(state.copyWith(isUpdating: true, updateSuccess: false, error: null));

    final result = await updateProjectUseCase(request);

    result.fold(
      (failure) {
        emit(state.copyWith(isUpdating: false, error: failure.message));
      },
      (_) async {
        emit(state.copyWith(isUpdating: false, updateSuccess: true));

        await getProjects();
      },
    );
  }
}
