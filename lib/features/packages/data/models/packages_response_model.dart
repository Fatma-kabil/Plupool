import '../../domain/entities/packages_response_entity.dart';
import 'package_model.dart';
import 'packages_stats_model.dart';

class PackagesResponseModel extends PackagesResponseEntity {
  PackagesResponseModel({
    required super.total,
    required super.filteredCount,
    required super.limit,
    required super.returned,
    required super.stats,
    required super.packages,
  });

  factory PackagesResponseModel.fromJson(Map<String, dynamic> json) {
    return PackagesResponseModel(
      total: json['total'] ?? 0,
      filteredCount: json['filtered_count'] ?? 0,
      limit: json['limit'] ?? 0,
      returned: json['returned'] ?? 0,
      stats: PackagesStatsModel.fromJson(
        json['stats'] ?? {},
      ),
      packages: (json['packages'] as List? ?? [])
          .map((e) => PackageModel.fromJson(e))
          .toList(),
    );
  }
}