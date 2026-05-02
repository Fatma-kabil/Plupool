import 'package_model.dart';
import 'packages_stats_model.dart';

class PackagesResponseModel {
  final int total;
  final int filteredCount;
  final int limit;
  final int returned;
  final PackagesStatsModel stats;
  final List<PackageModel> packages;

  PackagesResponseModel({
    required this.total,
    required this.filteredCount,
    required this.limit,
    required this.returned,
    required this.stats,
    required this.packages,
  });

  factory PackagesResponseModel.fromJson(Map<String, dynamic> json) {
    return PackagesResponseModel(
      total: json['total'],
      filteredCount: json['filtered_count'],
      limit: json['limit'],
      returned: json['returned'],
      stats: PackagesStatsModel.fromJson(json['stats']),
      packages: (json['packages'] as List)
          .map((e) => PackageModel.fromJson(e))
          .toList(),
    );
  }
}