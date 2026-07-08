import 'package:equatable/equatable.dart';
import 'package:plupool/features/store/domain/entities/cart_entity.dart';

class CartState extends Equatable {
  final bool isLoading; // add / delete / update
  final bool isCartLoading; // get cart

final bool isDeleteSuccess;
  final bool isSuccess;
  final String? errorMessage;

  final int cartCount;

  final CartEntity? cart;
  final bool isOrderSuccess;

  const CartState({
    this.isLoading =false,
    this.isCartLoading = false,
    this.isSuccess = false,
    this.errorMessage,
    this.cartCount = 0,
    this.isDeleteSuccess = false,
    this.cart,
    this.isOrderSuccess = false,
  });

  CartState copyWith({
    bool? isLoading,
    bool? isCartLoading,
    bool? isSuccess,
    String? errorMessage,
    int? cartCount,
    CartEntity? cart,
    bool? isDeleteSuccess,
    bool? isOrderSuccess,
  }) {
    return CartState(
      isLoading: isLoading ?? this.isLoading,
      isCartLoading: isCartLoading ?? this.isCartLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
      cartCount: cartCount ?? this.cartCount,
      cart: cart ?? this.cart,
      isDeleteSuccess: isDeleteSuccess ?? this.isDeleteSuccess,
      isOrderSuccess:
    isOrderSuccess ?? this.isOrderSuccess,
    );
  }

  CartState clearError() {
    return copyWith(errorMessage: null);
  }

  @override
  List<Object?> get props => [
        isLoading,
        isCartLoading,
        isSuccess,
        errorMessage,
        cartCount,
        cart,
        isDeleteSuccess,
        isOrderSuccess
        
      ];
}