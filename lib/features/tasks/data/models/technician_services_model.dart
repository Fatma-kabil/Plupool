import '../../domain/entities/technician_services_entity.dart';
import 'service_item_model.dart';
import 'services_stats_model.dart';

class TechnicianServicesModel extends TechnicianServicesEntity {
  const TechnicianServicesModel({
    required super.total,
    required super.filteredCount,
    required super.returned,
    required super.limit,
    required super.stats,
    required super.items,
  });

  factory TechnicianServicesModel.fromJson(Map<String, dynamic> json) {
    return TechnicianServicesModel(
      total: json['total'],
      filteredCount: json['filtered_count'],
      returned: json['returned'],
      limit: json['limit'],
      stats: ServicesStatsModel.fromJson(json['stats']),
      items: (json['items'] as List)
          .map((e) => ServiceItemModel.fromJson(e))
          .toList(),
    );
  }
}