import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/store/data/models/add_to_cart_rquest_model.dart';
import 'package:plupool/features/store/domain/usecases/add_to_cart_uscae.dart';

import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.addToCartUseCase) : super(const CartState());

  final AddToCartUseCase addToCartUseCase;

  Future<void> addToCart({
    required int productId,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,
        isSuccess: false,
      ),
    );

    final result = await addToCartUseCase(
     request: AddToCartRequestModel(
        productId: productId,
        quantity: 1,
      )
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
      (_) {
        emit(
          const CartState(
            isLoading: false,
            isSuccess: true,
          ),
        );
      },
    );
  }
}