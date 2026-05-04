import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/projects/domain/usecases/get_our_projects_usecase.dart';
import 'package:plupool/features/projects/presentation/manager/project_cubit/project_state.dart';


class ProjectsCubit extends Cubit<ProjectsState> {
  final GetOurProjectsUseCase getProjectsUseCase;

  ProjectsCubit(this.getProjectsUseCase)
      : super(ProjectsInitial());

  Future<void> getProjects({
    int skip = 0,
    int limit = 50,
    String? status,
  }) async {
    try {
      emit(OurProjectsLoading());

      final result = await getProjectsUseCase(
        skip: skip,
        limit: limit,
        status: status,
      );

      emit(OurProjectsSuccess(result));
    } catch (e) {
      emit(OurProjectsError(e.toString()));
    }
  }
}