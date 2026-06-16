import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/company_res/domain/entities/client_entity.dart';

abstract class CompanyResClientsRepository {
  Future<Either<Failure, List<ClientEntity>>> getClients({
    required int userId,
    String? search,
    bool? isActive,
    int page,
    int pageSize,
  });
}