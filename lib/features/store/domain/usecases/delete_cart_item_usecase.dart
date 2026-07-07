import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/store/domain/repos/cart_rpo.dart';

class DeleteCartItemUseCase {
  final CartRepo repo;

  DeleteCartItemUseCase(this.repo);

  Future<Either<Failure, void>> call({
    required int cartItemId,
  }) {
    return repo.deleteCartItem(
      cartItemId: cartItemId,
    );
  }
}