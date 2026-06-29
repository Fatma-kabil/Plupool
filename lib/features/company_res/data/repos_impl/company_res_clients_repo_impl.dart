import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/company_res/data/remote_data_sources/company_res_clients_remote_data_source.dart';
import 'package:plupool/features/company_res/domain/entities/client_entity.dart';
import 'package:plupool/features/company_res/domain/repos/company_res_clients_repos.dart';

class CompanyResClientsRepositoryImpl implements CompanyResClientsRepository {
  final CompanyResClientsRemoteDataSource remote;

  CompanyResClientsRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, List<ClientEntity>>> getClients({
    required int userId,
    String? search,
    bool? isActive,
    int page = 1,
    int pageSize = 20,
  }) async {
    try {
      final clients = await remote.getClients(
        userId: userId,
        search: search,
        isActive: isActive,
        page: page,
        pageSize: pageSize,
      );

      return right(clients);
    } catch (e) {
      return left(mapDioError(e));
    }
  }

  Future<void> deleteClient(int userId, int clientId) {
    return remote.deleteClient(userId, clientId);
  }
}
