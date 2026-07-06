import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/store/data/data_sources/user_order_remote_data_source.dart';
import 'package:plupool/features/store/domain/entities/store_rder_entity.dart';
import 'package:plupool/features/store/domain/repos/store_oder_repo.dart';

class StoreOrdersRepoImpl implements StoreOrdersRepo {
  final StoreOrdersRemoteDataSource remoteDataSource;

  StoreOrdersRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<StoreOrderEntity>>> getStoreOrders() async {
    try {
      final orders = await remoteDataSource.getStoreOrders();
      return Right(orders);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
