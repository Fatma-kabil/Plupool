import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/projects/domain/usecases/get_our_projects_usecase.dart';
import 'package:plupool/features/projects/presentation/manager/project_cubit/project_state.dart';

class OurProjectsCubit extends Cubit<OurProjectsState> {
  final GetOurProjectsUseCase getOurProjectsUseCase;

  OurProjectsCubit(this.getOurProjectsUseCase)
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
}
