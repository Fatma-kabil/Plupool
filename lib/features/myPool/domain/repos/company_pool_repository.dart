import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/myPool/domain/entities/company_pool_entity.dart';

abstract class CompanyPoolRepository {
  Future<Either<Failure, CompanyPoolEntity>> getCompanyPools({
    required int clientId,
    String? tab,
    String? bookingType,
    String? status,
    int limit = 100,
  });
}