import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/myPool/domain/entities/company_pool_entity.dart';
import 'package:plupool/features/myPool/domain/repos/company_pool_repository.dart';

class GetCompanyPoolsUseCase
   {
  final CompanyPoolRepository repository;

  GetCompanyPoolsUseCase(this.repository);

  Future<Either<Failure, CompanyPoolEntity>> call(
    GetCompanyPoolsParams params,
  ) {
    return repository.getCompanyPools(
      clientId: params.clientId,
    );
  }
}class GetCompanyPoolsParams {
  final int clientId;
  final String? tab;
  final String? bookingType;
  final String? status;
  final int limit;

  GetCompanyPoolsParams({
    required this.clientId,
    this.tab,
    this.bookingType,
    this.status,
    this.limit = 50,
  });
}