import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/store/data/models/add_to_cart_rquest_model.dart';
import 'package:plupool/features/store/domain/usecases/add_to_cart_uscae.dart';
import 'package:plupool/features/store/domain/usecases/get_cart_count_usecase.dart';

import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartCountUseCase getCartCountUseCase;
  final AddToCartUseCase addToCartUseCase;

  CartCubit(this.addToCartUseCase, this.getCartCountUseCase)
    : super(const CartState());

  Future<void> addToCart({required int productId}) async {
    emit(state.copyWith(isLoading: true, isSuccess: false));

    final result = await addToCartUseCase(
      request: AddToCartRequestModel(productId: productId, quantity: 1),
    );

    result.fold(
      (failure) {
        emit(
          CartState(
            isLoading: false,
            isSuccess: false,
            errorMessage: failure.message,
          ),
        );
      },
      (_) async {
        emit(const CartState(isLoading: false, isSuccess: true));
        await getCartCount();
      },
    );
  }

  Future<void> getCartCount() async {
    final result = await getCartCountUseCase();

    result.fold(
      (failure) {
        emit(state.copyWith(errorMessage: failure.message));
      },
      (count) {
        emit(state.copyWith(cartCount: count.totalItems));
      },
    );
  }
}
