import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/store/domain/entities/cart_entity.dart';
import 'package:plupool/features/store/domain/repos/cart_rpo.dart';

class GetCartUseCase {
  final CartRepo repo;

  GetCartUseCase(this.repo);

  Future<Either<Failure, CartEntity>> call() {
    return repo.getCart();
  }
}