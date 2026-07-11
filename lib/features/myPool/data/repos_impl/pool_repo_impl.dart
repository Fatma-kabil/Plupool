import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/myPool/data/remote_data_source/pool_remote_data_source.dart';
import 'package:plupool/features/myPool/domain/entities/pool_info_entity.dart';
import 'package:plupool/features/myPool/domain/repos/pool_reposistory.dart';


class PoolInfoRepositoryImpl implements PoolInfoRepository {
  final PoolInfoRemoteDataSource remoteDataSource;

  PoolInfoRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, PoolInfoEntity>> getPoolInfo() async {
    try {
      final result = await remoteDataSource.getPoolInfo();
      return Right(result);
    }catch (e) {
      return Left(mapDioError(e));
    }
  }
}