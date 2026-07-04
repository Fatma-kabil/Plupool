import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/myPool/domain/entities/pool_info_entity.dart';
import 'package:plupool/features/myPool/domain/repos/pool_reposistory.dart';

class GetPoolInfoUseCase {
  final PoolInfoRepository repository;

  GetPoolInfoUseCase(this.repository);

  Future<Either<Failure, PoolInfoEntity>> call() {
    return repository.getPoolInfo();
  }
}