import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/myPool/domain/entities/clients_response_entity.dart';
import 'package:plupool/features/myPool/domain/usecases/get_company_clients_usecase.dart';
import 'package:plupool/features/myPool/presentation/views/manager/company_clients_cubit/company_clients_state.dart';

class CompanyClientsCubit extends Cubit<CompanyClientsState> {
  CompanyClientsCubit(this.getCompanyClientsUseCase)
      : super(CompanyClientsInitial());

  final GetCompanyClientsUseCase getCompanyClientsUseCase;

  ClientsResponseEntity? response;

  Future<void> getClients({
    String? search,
    bool? isActive,
    int skip = 0,
    int limit = 20,
    bool isSearch = false,
  }) async {
    if (isSearch) {
      emit(SearchClientsLoading());
    } else {
      emit(GetClientsLoading());
    }

    final result = await getCompanyClientsUseCase(
      search: search,
      isActive: isActive,
      skip: skip,
      limit: limit,
    );

    result.fold(
      (failure) => emit(GetClientsFailure(failure.message)),
      (data) {
        response = data;
        emit(GetClientsSuccess(data));
      },
    );
  }
}