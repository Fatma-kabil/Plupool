import 'package:equatable/equatable.dart';
import 'package:plupool/features/store/domain/entities/cart_entity.dart';

class CartState extends Equatable {
  final bool isLoading;
   final bool isCartLoading;
  final bool isSuccess;
  final String? errorMessage;

  final int cartCount;

  final CartEntity? cart;

  const CartState({
    this.isLoading = false,
    this.isCartLoading = false,
    this.isSuccess = false,
    this.errorMessage,
    this.cartCount = 0,
    this.cart,
  });

  CartState copyWith({
    bool? isLoading,
    bool? isCartLoading,
    bool? isSuccess,
    String? errorMessage,
    int? cartCount,
    CartEntity? cart,
  }) {
    return CartState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
      cartCount: cartCount ?? this.cartCount,
      cart: cart ?? this.cart,
      isCartLoading: isCartLoading ?? this.isCartLoading,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        isCartLoading,
        isSuccess,
        errorMessage,
        cartCount,
        cart,
      ];
}