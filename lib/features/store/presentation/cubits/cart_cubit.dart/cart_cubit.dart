import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/store/data/models/add_to_cart_rquest_model.dart';
import 'package:plupool/features/store/data/models/confirm_order_request_model.dart';
import 'package:plupool/features/store/data/models/update_cart_item_request.dart';
import 'package:plupool/features/store/domain/usecases/add_to_cart_uscae.dart';
import 'package:plupool/features/store/domain/usecases/confirm_order_usecase.dart';
import 'package:plupool/features/store/domain/usecases/delete_cart_item_usecase.dart';
import 'package:plupool/features/store/domain/usecases/get_cart_count_usecase.dart';
import 'package:plupool/features/store/domain/usecases/get_cart_usecase.dart';
import 'package:plupool/features/store/domain/usecases/update_cart_item_usecase.dart';

import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartCountUseCase getCartCountUseCase;
  final AddToCartUseCase addToCartUseCase;
  final GetCartUseCase getCartUseCase;
  final DeleteCartItemUseCase deleteCartItemUseCase;
  final UpdateCartItemUseCase updateCartItemUseCase;
  final ConfirmOrderUseCase confirmOrderUseCase;
  CartCubit(
    this.addToCartUseCase,
    this.getCartCountUseCase,
    this.getCartUseCase,
    this.deleteCartItemUseCase,
    this.updateCartItemUseCase,
    this.confirmOrderUseCase,
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

  Future<void> updateCartItem({
    required int cartItemId,
    required int quantity,
  }) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await updateCartItemUseCase(
      cartItemId: cartItemId,
      request: UpdateCartItemRequest(quantity: quantity),
    );

    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, errorMessage: failure.message));
      },
      (_) async {
        emit(state.copyWith(isLoading: false));

        await getCart();
        await getCartCount();
      },
    );
  }

  Future<void> confirmOrder({
    required String address,
    required String phone,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        isOrderSuccess: false,
      ),
    );
  print("========== Confirm Order ==========");
  print("Address: $address");
  print("Phone: $phone");
  print("Payment: CASH_ON_DELIVERY");
  print("Cart Items: ${state.cart?.items.length}");
  print("===================================");

    final result = await confirmOrderUseCase(
      request: ConfirmOrderRequestModel(
        deliveryAddress: address,
        deliveryPhone: phone,
        paymentMethod: "CASH_ON_DELIVERY",
      ),
    );

    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, errorMessage: failure.message));
        
      },
      (_) async {
        await getCartCount();
        await getCart();

        emit(state.copyWith(isLoading: false, isOrderSuccess: true));
      },
    );
  }

  void clearError() {
    emit(state.copyWith(errorMessage: null));
  }

  void clearDeleteSuccess() {
    emit(state.copyWith(isDeleteSuccess: false));
  }

  void clearOrderSuccess() {
    emit(state.copyWith(isOrderSuccess: false));
  }
}
