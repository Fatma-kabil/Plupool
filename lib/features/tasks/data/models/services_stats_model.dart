

import 'package:plupool/features/tasks/domain/entities/service_states_entity.dart';

class ServicesStatsModel extends ServicesStatsEntity {
  const ServicesStatsModel({
    required super.services,
    required super.packages,
    required super.construction,
    required super.scheduled,
    required super.urgent,
    required super.inProgress,
    required super.completed,
  });

  factory ServicesStatsModel.fromJson(Map<String, dynamic> json) {
    return ServicesStatsModel(
      services: json['services'],
      packages: json['packages'],
      construction: json['construction'],
      scheduled: json['scheduled'],
      urgent: json['urgent'],
      inProgress: json['in_progress'],
      completed: json['completed'],
    );
  }
}