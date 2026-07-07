import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/store/data/models/update_cart_item_request.dart';
import 'package:plupool/features/store/domain/repos/cart_rpo.dart';

class UpdateCartItemUseCase {
  final CartRepo repository;

  UpdateCartItemUseCase(this.repository);

  Future<Either<Failure, Unit>> call({
    required int cartItemId,
    required UpdateCartItemRequest request,
  }) {
    return repository.updateCartItem(
      cartItemId: cartItemId,
      request: request,
    );
  }
}