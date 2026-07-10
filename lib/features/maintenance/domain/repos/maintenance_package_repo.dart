import 'package:plupool/features/maintenance/domain/entities/maintenance_package_entity.dart';

abstract class MaintenancePackageRepository {
  Future<List<MaintenancePackageEntity>> getPackages({String? duration});
}
