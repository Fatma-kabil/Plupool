import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/store/domain/usecases/get_store_orders_usecase.dart';
import 'store_orders_state.dart';

class StoreOrdersCubit extends Cubit<StoreOrdersState> {
  StoreOrdersCubit(this.getStoreOrdersUseCase)
      : super(const StoreOrdersState());

  final GetStoreOrdersUseCase getStoreOrdersUseCase;

  Future<void> getStoreOrders() async {
    emit(state.copyWith(status: StoreOrdersStatus.loading));

    final result = await getStoreOrdersUseCase();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: StoreOrdersStatus.failure,
            errorMessage: failure.message,
          ),
        );
      },
      (orders) {
        emit(
          state.copyWith(
            status: StoreOrdersStatus.success,
            orders: orders,
          ),
        );
      },
    );
  }
}