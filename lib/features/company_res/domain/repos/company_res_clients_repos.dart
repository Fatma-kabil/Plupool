import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/company_res/domain/entities/client_entity.dart';
import 'package:plupool/features/company_res/domain/entities/create_client_params.dart';
import 'package:plupool/features/company_res/domain/entities/create_client_response_entity.dart' hide ClientEntity;

abstract class CompanyResClientsRepository {
  Future<Either<Failure, List<ClientEntity>>> getClients({
    required int userId,
    String? search,
    bool? isActive,
    int page,
    int pageSize,
  });
  Future<void> deleteClient(int userId, int clientId);
  Future<CreateClientResponseEntity> createClient({
  required CreateClientParams params,
});
}
