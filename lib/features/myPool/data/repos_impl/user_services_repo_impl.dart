import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/myPool/data/remote_data_source/user_service_remote_data_source.dart';
import 'package:plupool/features/myPool/domain/entities/user_service_entity.dart';
import 'package:plupool/features/myPool/domain/repos/user_services_repoditory.dart';

class UserServicesRepoImpl implements UserServicesRepoditory {
  final UserServiceRemoteDataSource remoteDataSource;
  UserServicesRepoImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, List<UserServiceEntity>>> getUserServices({
    String? tab,
    String? status,
    String? search,
    int? skip,
    int? limit,
  }) async {
    try {
      final services = await remoteDataSource.getUserServices(
        tab: tab,
        status: status,
        search: search,
        skip: skip,
        limit: limit,
      );

      return Right(services);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
