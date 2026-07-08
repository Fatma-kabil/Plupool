import 'package:plupool/features/maintenance/domain/repos/maintenance_repository.dart';

import '../entities/maintenance_service_entity.dart';

class GetMaintenanceServiceUseCase {
  final MaintenanceRepository repository;

  GetMaintenanceServiceUseCase(this.repository);

  Future<MaintenanceServiceEntity> call() {
    return repository.getMaintenanceService();
  }
}