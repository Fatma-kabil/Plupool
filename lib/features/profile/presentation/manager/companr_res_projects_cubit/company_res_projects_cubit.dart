import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/profile/domain/entities/company_project_entity.dart';
import 'package:plupool/features/profile/domain/get_company_projects_usecase.dart';
import 'package:plupool/features/profile/presentation/manager/companr_res_projects_cubit/company_res_projects_state.dart';


class CompanyResProjectsCubit extends Cubit<CompanyProjectsState> {
  CompanyResProjectsCubit({
    required GetCompanyResProjectsUseCase getCompanyProjectsUseCase,
  })  : _getCompanyProjectsUseCase = getCompanyProjectsUseCase,
        super(CompanyProjectsInitial());

  final GetCompanyResProjectsUseCase _getCompanyProjectsUseCase;

  List<CompanyProjectEntity> projects = [];

  String? currentStatus;
  String? currentSearch;

  Future<void> getCompanyProjects({
    String? status,
    String? search,
    int skip = 0,
    int limit = 20,
  }) async {
    currentStatus = status;
    currentSearch = search;

    emit(GetCompanyProjectsLoading());

    final result = await _getCompanyProjectsUseCase(
      status: status,
      skip: skip,
      limit: limit,
    );

    result.fold(
      (failure) {
        emit(GetCompanyProjectsFailure(failure.message));
      },
      (data) {
        projects = data;
        emit(GetCompanyProjectsSuccess(data));
      },
    );
  }

  Future<void> refresh() async {
    await getCompanyProjects(
      status: currentStatus,
      search: currentSearch,
    );
  }
}