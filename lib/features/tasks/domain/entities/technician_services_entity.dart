import 'package:plupool/features/tasks/domain/entities/service_states_entity.dart';
import 'package:plupool/features/tasks/domain/entities/technician_service_item_entity.dart';

class TechnicianServicesEntity {
  final int total;
  final int filteredCount;
  final int returned;
  final int limit;
  final ServicesStatsEntity stats;
  final List<ServiceItemEntity> items;

  const TechnicianServicesEntity({
    required this.total,
    required this.filteredCount,
    required this.returned,
    required this.limit,
    required this.stats,
    required this.items,
  });
}