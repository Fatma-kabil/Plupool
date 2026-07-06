import 'package:equatable/equatable.dart';

class CartState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;
  final int cartCount;

  const CartState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
    this.cartCount = 0,
  });

  CartState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    int? cartCount,
  }) {
    return CartState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
      cartCount: cartCount ?? this.cartCount,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        isSuccess,
        errorMessage,
        cartCount,
      ];
}