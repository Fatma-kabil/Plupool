import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/store/data/models/add_to_cart_rquest_model.dart';
import 'package:plupool/features/store/domain/repos/cart_rpo.dart';

class AddToCartUseCase {
  final CartRepo repo;

  AddToCartUseCase(this.repo);

  Future<Either<Failure, Unit>> call({
required AddToCartRequestModel request,
  }) {
    return repo.addToCart(
      request: request,
    );
  }
}