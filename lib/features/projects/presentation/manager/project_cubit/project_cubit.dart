import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/projects/domain/usecases/delete_project_usecase.dart';
import 'package:plupool/features/projects/domain/usecases/get_our_projects_usecase.dart';
import 'package:plupool/features/projects/presentation/manager/project_cubit/project_state.dart';

class OurProjectsCubit extends Cubit<OurProjectsState> {
  final GetOurProjectsUseCase getOurProjectsUseCase;
  
  final DeleteProjectUseCase deleteProjectUseCase;

  OurProjectsCubit(this.getOurProjectsUseCase,this.deleteProjectUseCase
  )
    : super(const OurProjectsState());

  Future<void> getProjects({
    int skip = 0,
    int limit = 50,
    String? status,
  }) async {
    emit(state.copyWith(isLoading: true, error: null));

    final result = await getOurProjectsUseCase(
      skip: skip,
      limit: limit,
      status: status,
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

}
