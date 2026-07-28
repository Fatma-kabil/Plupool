import '../../domain/entities/stats_entity.dart';

class StatsModel extends StatsEntity {
  const StatsModel({
    required super.services,
    required super.packages,
    required super.projects,
    required super.inProgress,
    required super.scheduled,
    required super.urgent,
    required super.completed,
  });

  factory StatsModel.fromJson(Map<String, dynamic> json) {
    return StatsModel(
      services: json['services'] ?? 0,
      packages: json['packages'] ?? 0,
      projects: json['projects'] ?? 0,
      inProgress: json['in_progress'] ?? 0,
      scheduled: json['scheduled'] ?? 0,
      urgent: json['urgent'] ?? 0,
      completed: json['completed'] ?? 0,
    );
  }

  StatsEntity toEntity() => this;
}