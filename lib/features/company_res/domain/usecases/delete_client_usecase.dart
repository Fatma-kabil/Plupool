

import 'package:plupool/features/company_res/domain/repos/company_res_clients_repos.dart';

class DeleteClientUseCase {
  final CompanyResClientsRepository repo;

  DeleteClientUseCase(this.repo);

  Future<void> call(int userId , int clientId) {
    return repo.deleteClient(userId , clientId);
  }
}