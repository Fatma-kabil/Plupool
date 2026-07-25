import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/myPool/domain/entities/clients_response_entity.dart';

abstract class CompanyClientsRepository {
  Future<Either<Failure, ClientsResponseEntity>> getClients({
    String? search,
    bool? isActive,
    int skip = 0,
    int limit = 100,
  });
}