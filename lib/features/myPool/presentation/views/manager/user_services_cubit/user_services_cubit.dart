
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/myPool/domain/usecases/get_user_services_usecase.dart';

import 'user_service_state.dart';

class UserServicesCubit extends Cubit<UserServicesState> {
  final GetUserServicesUsecase getUserServicesUsecase;

  UserServicesCubit(this.getUserServicesUsecase)
      : super(const UserServicesState());

  Future<void> getServices({
    String? tab,
    String? status,
    String? search,
    int? skip,
    int? limit,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
      ),
    );

    final result = await getUserServicesUsecase(
      tab: tab,
      status: status,
      search: search,
      skip: skip,
      limit: limit,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: failure.message,
          ),
        );
      },
      (services) {
        emit(
          state.copyWith(
            isLoading: false,
            services: services,
            errorMessage: null,
          ),
        );
      },
    );
  }
}