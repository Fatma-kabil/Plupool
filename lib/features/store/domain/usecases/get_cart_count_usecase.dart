import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/store/domain/entities/cart_count_entity.dart';
import 'package:plupool/features/store/domain/repos/cart_rpo.dart';

class GetCartCountUseCase {
  final CartRepo repo;

  GetCartCountUseCase(this.repo);

  Future<Either<Failure, CartCountEntity>> call() {
    return repo.getCartCount();
  }
}