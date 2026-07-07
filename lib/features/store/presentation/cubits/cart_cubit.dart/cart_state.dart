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

  const CartState({
    this.isLoading =false,
    this.isCartLoading = false,
    this.isSuccess = false,
    this.errorMessage,
    this.cartCount = 0,
    this.isDeleteSuccess = false,
    this.cart,
  });

  CartState copyWith({
    bool? isLoading,
    bool? isCartLoading,
    bool? isSuccess,
    String? errorMessage,
    int? cartCount,
    CartEntity? cart,
    bool? isDeleteSuccess,
  }) {
    return CartState(
      isLoading: isLoading ?? this.isLoading,
      isCartLoading: isCartLoading ?? this.isCartLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
      cartCount: cartCount ?? this.cartCount,
      cart: cart ?? this.cart,
      isDeleteSuccess: isDeleteSuccess ?? this.isDeleteSuccess,
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
        
      ];
}