import 'package_entity.dart';
import 'packages_stats_entity.dart';

class PackagesResponseEntity {
  final int total;
  final int filteredCount;
  final int limit;
  final int returned;
  final PackagesStatsEntity stats;
  final List<PackageEntity> packages;

  PackagesResponseEntity({
    required this.total,
    required this.filteredCount,
    required this.limit,
    required this.returned,
    required this.stats,
    required this.packages,
  });
}