import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/consruction_service/data/remote_data_source/pool_type_remote_data_source.dart';
import 'package:plupool/features/consruction_service/domain/entities/pool_type_entity.dart';
import 'package:plupool/features/consruction_service/domain/repos/pool_type_repo.dart';

class PoolTypeRepoImpl implements PoolTypeRepo {
  final PoolTypeRemoteDataSource remoteDataSource;

  PoolTypeRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<PoolTypeEntity>>> getPoolTypes() async {
    try {
      final result = await remoteDataSource.getPoolTypes();
      return right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}