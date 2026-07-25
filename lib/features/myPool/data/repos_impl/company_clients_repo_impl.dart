import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/myPool/data/remote_data_source/company_client_remote_data_source.dart';
import 'package:plupool/features/myPool/domain/entities/clients_response_entity.dart';
import 'package:plupool/features/myPool/domain/repos/company_client_repo.dart';

class CompanyClientsRepositoryImpl implements CompanyClientsRepository {
  final CompanyClientRemoteDataSource remoteDataSource;

  CompanyClientsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, ClientsResponseEntity>> getClients({
    String? search,
    bool? isActive,
    int skip = 0,
    int limit = 20,
  }) async {
    try {
      final result = await remoteDataSource.getClients(
        search: search,
        isActive: isActive,
        skip: skip,
        limit: limit,
      );

      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}