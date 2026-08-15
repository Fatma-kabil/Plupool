import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:plupool/features/company_res/domain/entities/create_client_params.dart';
import 'package:plupool/features/company_res/domain/usecases/create_client_usecase.dart';
import 'package:plupool/features/company_res/domain/usecases/get_company_res_usecase.dart';

import 'company_res_clients_state.dart';

class CompanyResClientsCubit extends Cubit<CompanyResClientsState> {
  final GetCompanyResClientsUseCase getCompanyResClientsUseCase;
  final CreateClientUseCase createClientUseCase;

  CompanyResClientsCubit(
    this.getCompanyResClientsUseCase,
    this.createClientUseCase,
  ) : super(CompanyResClientsState());

  // ============================================================
  // GET CLIENTS
  // ============================================================

  Future<void> getClients({
    required int userId,
    String? search,
    bool? isActive,
    int page = 1,
    int pageSize = 20,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,

        // نمسح أخطاء الـ GET القديمة
        clearError: true,

        // مهم جدًا:
        // لما نعمل GET جديد مش عايزين listener بتاع CREATE
        // يشتغل مرة تانية
        createSuccess: false,
        clearCreatedClient: true,
        clearCreateError: true,

        search: search,
        isActive: isActive,
      ),
    );

    final result = await getCompanyResClientsUseCase(
      userId: userId,
      search: search,
      isActive: isActive,
      page: page,
      pageSize: pageSize,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            error: failure.message,
          ),
        );
      },
      (clients) {
        emit(
          state.copyWith(
            isLoading: false,
            clients: clients,
            clearError: true,
          ),
        );
      },
    );
  }

  // ============================================================
  // CREATE CLIENT
  // ============================================================

  Future<void> createClient({
    required int companyRepId,
    required String phone,
    required String countryCode,
    required String fullName,
    required String address,
    required bool isActive,
  }) async {
    emit(
      state.copyWith(
        isCreating: true,

        createSuccess: false,

        clearCreateError: true,
        clearCreatedClient: true,
      ),
    );

    try {
      // ----------------------------------------------------------
      // CREATE
      // ----------------------------------------------------------

      final response = await createClientUseCase(
        CreateClientParams(
          companyRepId: companyRepId,
          phone: phone,
          countryCode: countryCode,
          fullName: fullName,
          address: address,
          isActive: isActive,
        ),
      );

      // ----------------------------------------------------------
      // CREATE SUCCESS
      // ----------------------------------------------------------

      emit(
        state.copyWith(
          isCreating: false,
          createdClient: response,
          createSuccess: true,
          clearCreateError: true,
        ),
      );

      // ----------------------------------------------------------
      // REFRESH CLIENTS
      // ----------------------------------------------------------

      await getClients(
        userId: companyRepId,
        search: state.search,
        isActive: state.isActive,
      );
    } catch (e) {
      // ----------------------------------------------------------
      // CREATE ERROR
      // ----------------------------------------------------------

      emit(
        state.copyWith(
          isCreating: false,
          createSuccess: false,
          createError: e.toString(),
        ),
      );

      // ----------------------------------------------------------
      // حتى لو الـ CREATE فشل
      // نعمل GET CLIENTS تاني
      // ----------------------------------------------------------

      await getClients(
        userId: companyRepId,
        search: state.search,
        isActive: state.isActive,
      );
    }
  }
}