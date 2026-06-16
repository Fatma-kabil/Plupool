import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/company_res/domain/entities/client_entity.dart';
import 'package:plupool/features/company_res/domain/repos/company_res_clients_repos.dart';

class GetCompanyResClientsUseCase {
  final CompanyResClientsRepository repository;

  GetCompanyResClientsUseCase(this.repository);

  Future<Either<Failure, List<ClientEntity>>> call({
    required int userId,
    String? search,
    bool? isActive,
    int page = 1,
    int pageSize = 20,
  }) {
    return repository.getClients(
      userId: userId,
      search: search,
      isActive: isActive,
      page: page,
      pageSize: pageSize,
    );
  }
}