import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/consruction_service/domain/entities/pool_type_entity.dart';
import 'package:plupool/features/consruction_service/domain/repos/pool_type_repo.dart';

class GetPoolTypesUseCase {
  final PoolTypeRepo repo;

  GetPoolTypesUseCase(this.repo);

  Future<Either<Failure, List<PoolTypeEntity>>> call() {
    return repo.getPoolTypes();
  }
}