import 'client_entity.dart';
import 'clients_stats_entity.dart';

class ClientsResponseEntity {
  final int total;
  final int filteredCount;
  final int returned;
  final int limit;
  final ClientsStatsEntity stats;
  final List<ClientEntity> items;

  ClientsResponseEntity({
    required this.total,
    required this.filteredCount,
    required this.returned,
    required this.limit,
    required this.stats,
    required this.items,
  });
}