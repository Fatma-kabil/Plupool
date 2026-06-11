

import 'package:plupool/features/projects/domain/entities/projects_statistics_entity.dart';

class ProjectStatisticsModel extends ProjectStatisticsEntity {
  ProjectStatisticsModel({
    required super.totalProjects,
    required super.inProgress,
    required super.completed,
  });

  factory ProjectStatisticsModel.fromJson(Map<String, dynamic> json) {
    return ProjectStatisticsModel(
      totalProjects: json['total_projects'] ?? 0,
      inProgress: json['in_progress'] ?? 0,
      completed: json['completed'] ?? 0,
    );
  }
}