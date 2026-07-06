import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/store/data/data_sources/cart_remote_data_source.dart';
import 'package:plupool/features/store/data/models/add_to_cart_rquest_model.dart';
import 'package:plupool/features/store/domain/repos/cart_rpo.dart';

class CartRepoImpl implements CartRepo {
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepoImpl(this.cartRemoteDataSource);

 @override
Future<Either<Failure, Unit>> addToCart({
   required AddToCartRequestModel request,
}) async {
  try {
    await cartRemoteDataSource.addToCart(
      request: request,
    );

    return const Right(unit);
  } catch (e) {
      return Left(ServerFailure(e.toString()));
    }

  }
}