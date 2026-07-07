import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/store/data/models/add_to_cart_rquest_model.dart';
import 'package:plupool/features/store/domain/usecases/add_to_cart_uscae.dart';
import 'package:plupool/features/store/domain/usecases/delete_cart_item_usecase.dart';
import 'package:plupool/features/store/domain/usecases/get_cart_count_usecase.dart';
import 'package:plupool/features/store/domain/usecases/get_cart_usecase.dart';

import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartCountUseCase getCartCountUseCase;
  final AddToCartUseCase addToCartUseCase;
  final GetCartUseCase getCartUseCase;
  final DeleteCartItemUseCase deleteCartItemUseCase;
  CartCubit(
    this.addToCartUseCase,
    this.getCartCountUseCase,
    this.getCartUseCase,
    this.deleteCartItemUseCase,
  ) : super(const CartState());

  Future<void> addToCart({required int productId}) async {
    emit(state.copyWith(isLoading: true, isSuccess: false));

    final result = await addToCartUseCase(
      request: AddToCartRequestModel(productId: productId, quantity: 1),
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            isSuccess: false,
            errorMessage: failure.message,
          ),
        );
      },
      (_) async {
        emit(state.copyWith(isLoading: false, isSuccess: true));

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

  Future<void> getCart() async {
    emit(state.copyWith(isCartLoading: true));

    final result = await getCartUseCase();

    result.fold(
      (failure) {
        emit(
          state.copyWith(isCartLoading: false, errorMessage: failure.message),
        );
      },
      (cart) {
        emit(state.copyWith(isCartLoading: false, cart: cart));
      },
    );
  }

  Future<void> deleteCartItem({required int cartItemId}) async {
    emit(
      state.copyWith(
        isLoading: true,
        isDeleteSuccess: false,
        errorMessage: null,
      ),
    );

    final result = await deleteCartItemUseCase(cartItemId: cartItemId);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            isDeleteSuccess: false,
            errorMessage: failure.message,
          ),
        );
      },
      (_) async {
        
        await getCart();
        await getCartCount();
        emit(state.copyWith(isLoading: false, isDeleteSuccess: true));
      },
    );
  }

  void clearError() {
    emit(state.copyWith(errorMessage: null));
  }

 void clearDeleteSuccess() {
  emit(state.copyWith(isDeleteSuccess: false));
}
}
