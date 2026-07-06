import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/store/data/models/add_to_cart_rquest_model.dart';

abstract class CartRepo {
  Future<Either<Failure, Unit>> addToCart({
    required AddToCartRequestModel request,
  });
}
