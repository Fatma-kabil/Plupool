import 'package:plupool/features/services/domain/repos/company_service_repository.dart';

import '../entities/company_service_entity.dart';

class GetMaintenanceServicesUseCase {
  final CompanyServiceRepository repository;

  GetMaintenanceServicesUseCase(this.repository);

  Future<List<CompanyServiceEntity>> call({
    String? status,
    String? search,
    int? skip,
    int? limit,
  }) {
    return repository.getMaintenanceServices(
      status: status,
      search: search,
      skip: skip,
      limit: limit,
    );
  }
}