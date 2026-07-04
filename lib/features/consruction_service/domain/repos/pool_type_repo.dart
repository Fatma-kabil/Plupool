import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/consruction_service/domain/entities/pool_type_entity.dart';

abstract class PoolTypeRepo {
  Future<Either<Failure, List<PoolTypeEntity>>> getPoolTypes();
}