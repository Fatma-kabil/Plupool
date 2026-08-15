import 'package:plupool/features/company_res/domain/repos/company_res_clients_repos.dart';

import '../entities/create_client_params.dart';
import '../entities/create_client_response_entity.dart';

class CreateClientUseCase {
  final CompanyResClientsRepository repository;

  CreateClientUseCase(this.repository);

  Future<CreateClientResponseEntity> call(
    CreateClientParams params,
  ) async {
    return await repository.createClient(
      params: params,
    );
  }
}