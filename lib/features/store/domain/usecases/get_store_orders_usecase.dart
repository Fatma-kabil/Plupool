import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/store/domain/entities/store_rder_entity.dart';
import 'package:plupool/features/store/domain/repos/store_oder_repo.dart';

class GetStoreOrdersUseCase {
  final StoreOrdersRepo repo;

  GetStoreOrdersUseCase(this.repo);

  Future<Either<Failure, List<StoreOrderEntity>>> call() {
    return repo.getStoreOrders();
  }
}