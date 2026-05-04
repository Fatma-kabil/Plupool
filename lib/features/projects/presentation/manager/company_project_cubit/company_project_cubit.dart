import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/projects/domain/usecases/get_company_project_usecase.dart';
import 'package:plupool/features/projects/presentation/manager/company_project_cubit/compay_project_state.dart';



class CompanyProjectCubit extends Cubit<CompanyProjectState> {
  final GetCompanyProjectsUseCase useCase;

  CompanyProjectCubit(this.useCase) : super(CompanyProjectsInitial());

  Future<void> getCompanyProjects() async {
    emit(CompanyProjectsLoading());

    try {
      final data = await useCase();
      emit(CompanyProjectsSuccess(data));
    } catch (e) {
      emit(CompanyProjectsError(e.toString()));
    }
  }
}