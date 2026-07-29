import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/myPool/data/remote_data_source/company_pool_remote_data_source.dart';
import 'package:plupool/features/myPool/domain/entities/company_pool_entity.dart';
import 'package:plupool/features/myPool/domain/repos/company_pool_repository.dart';

class CompanyPoolRepositoryImpl implements CompanyPoolRepository {
  final CompanyPoolRemoteDataSource remoteDataSource;

  CompanyPoolRepositoryImpl({
    required this.remoteDataSource,
  });
@override
Future<Either<Failure, CompanyPoolEntity>> getCompanyPools({
  required int clientId,
  String? tab,
  String? bookingType,
  String? status,
  int limit = 100,
}) async {
  try {
    final result = await remoteDataSource.getCompanyPools(
      clientId: clientId,
      tab: tab,
      bookingType: bookingType,
      status: status,
      limit: limit,
    );

    return Right(result);
  } on DioException catch (e) {
    return Left(mapDioError(e));
  } catch (e) {
    return Left(ServerFailure(e.toString()));
  }
}
}