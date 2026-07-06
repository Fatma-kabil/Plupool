import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/store/domain/entities/store_rder_entity.dart';

abstract class StoreOrdersRepo {
  Future<Either<Failure, List<StoreOrderEntity>>> getStoreOrders();
}