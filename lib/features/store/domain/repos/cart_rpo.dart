import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/store/data/models/add_to_cart_rquest_model.dart';
import 'package:plupool/features/store/data/models/update_cart_item_request.dart';
import 'package:plupool/features/store/domain/entities/cart_count_entity.dart';
import 'package:plupool/features/store/domain/entities/cart_entity.dart';

abstract class CartRepo {
  Future<Either<Failure, Unit>> addToCart({
    required AddToCartRequestModel request,
  });
  Future<Either<Failure, CartCountEntity>> getCartCount();
  Future<Either<Failure, CartEntity>> getCart();
  Future<Either<Failure, void>> deleteCartItem({
  required int cartItemId,
});
Future<Either<Failure, Unit>> updateCartItem({
  required int cartItemId,
  required UpdateCartItemRequest request,
});
}
