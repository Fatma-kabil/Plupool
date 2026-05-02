import '../../domain/entities/packages_stats_entity.dart';

class PackagesStatsModel extends PackagesStatsEntity {
  PackagesStatsModel({
    required super.inProgress,
    required super.completed,
    required super.scheduled,
  });

  factory PackagesStatsModel.fromJson(Map<String, dynamic> json) {
    return PackagesStatsModel(
      inProgress: json['in_progress'] ?? 0,
      completed: json['completed'] ?? 0,
      scheduled: json['scheduled'] ?? 0,
    );
  }
}