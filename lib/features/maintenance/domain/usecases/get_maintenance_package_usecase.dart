import 'package:plupool/features/maintenance/domain/entities/maintenance_package_entity.dart';
import 'package:plupool/features/maintenance/domain/repos/maintenance_package_repo.dart';

class GetMaintenancePackagesUseCase {
  final MaintenancePackageRepository repository;

  GetMaintenancePackagesUseCase(this.repository);

  Future<List<MaintenancePackageEntity>> call({
    String? duration,
  }) {
    return repository.getPackages(
      duration: duration,
    );
  }
}