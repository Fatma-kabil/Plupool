import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/myPool/domain/entities/pool_info_entity.dart';

abstract class PoolInfoRepository {
  Future<Either<Failure, PoolInfoEntity>> getPoolInfo();
}