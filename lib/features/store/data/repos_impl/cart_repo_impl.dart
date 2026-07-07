import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/store/data/data_sources/cart_remote_data_source.dart';
import 'package:plupool/features/store/data/models/add_to_cart_rquest_model.dart';
import 'package:plupool/features/store/domain/entities/cart_count_entity.dart';
import 'package:plupool/features/store/domain/entities/cart_entity.dart';
import 'package:plupool/features/store/domain/repos/cart_rpo.dart';

class CartRepoImpl implements CartRepo {
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepoImpl(this.cartRemoteDataSource);

  @override
  Future<Either<Failure, Unit>> addToCart({
    required AddToCartRequestModel request,
  }) async {
    try {
      await cartRemoteDataSource.addToCart(request: request);

      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartCountEntity>> getCartCount() async {
    try {
      final result = await cartRemoteDataSource.getCartCount();

      return right(result);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartEntity>> getCart() async {
    try {
      final cart = await cartRemoteDataSource.getCart();

      return right(cart);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCartItem({
    required int cartItemId,
  }) async {
    try {
      await cartRemoteDataSource.deleteCartItem(cartItemId: cartItemId);

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
