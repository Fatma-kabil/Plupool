import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/company_res/domain/usecases/get_company_res_usecase.dart';
import 'company_res_clients_state.dart';

class CompanyResClientsCubit extends Cubit<CompanyResClientsState> {
  final GetCompanyResClientsUseCase getCompanyResClientsUseCase;

  CompanyResClientsCubit(this.getCompanyResClientsUseCase)
    : super(CompanyResClientsState());

  Future<void> getClients({
    required int userId,
    String? search,
    bool? isActive,
    int page = 1,
    int pageSize = 20,
  }) async {
    emit(state.copyWith(isLoading: true, error: null));

    final result = await getCompanyResClientsUseCase(
      userId: userId,
      search: search,
      isActive: isActive,
      page: page,
      pageSize: pageSize,
    );

    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, error: failure.message));
        print(failure);
      },
      (clients) {
        emit(state.copyWith(isLoading: false, clients: clients, error: null));
      },
    );
  }
}
