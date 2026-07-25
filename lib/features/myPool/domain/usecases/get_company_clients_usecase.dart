import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/myPool/domain/entities/clients_response_entity.dart';
import 'package:plupool/features/myPool/domain/repos/company_client_repo.dart';

class GetCompanyClientsUseCase {
  final CompanyClientsRepository repository;

  GetCompanyClientsUseCase(this.repository);

  Future<Either<Failure, ClientsResponseEntity>> call({
    String? search,
    bool? isActive,
    int skip = 0,
    int limit = 20,
  }) {
    return repository.getClients(
      search: search,
      isActive: isActive,
      skip: skip,
      limit: limit,
    );
  }
}