
import 'package:plupool/features/maintenance/domain/entities/maintenance_service_entity.dart';

abstract class MaintenanceRepository {
  Future<MaintenanceServiceEntity> getMaintenanceService();
}