import '../../domain/entities/clients_response_entity.dart';
import '../../domain/entities/clients_stats_entity.dart';
import 'client_model.dart';

class ClientsResponseModel extends ClientsResponseEntity {
  ClientsResponseModel({
    required super.total,
    required super.filteredCount,
    required super.returned,
    required super.limit,
    required super.stats,
    required super.items,
  });

  factory ClientsResponseModel.fromJson(Map<String, dynamic> json) {
    return ClientsResponseModel(
      total: json["total"],
      filteredCount: json["filtered_count"],
      returned: json["returned"],
      limit: json["limit"],
      stats: ClientsStatsEntity(
        totalPools: json["stats"]["total_pools"],
        activePackages: json["stats"]["active_packages"],
        completedTasks: json["stats"]["completed_tasks"],
        active: json["stats"]["active"],
        inactive: json["stats"]["inactive"],
      ),
      items: (json["items"] as List)
          .map((e) => ClientModel.fromJson(e))
          .toList(),
    );
  }
}