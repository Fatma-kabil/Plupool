import 'package:plupool/features/projects/domain/entities/company_project_entity.dart';
import 'package:plupool/features/projects/domain/entities/projects_statistics_entity.dart';

class CompanyProjectState {
  final bool isLoading;
  final List<CompanyProjectEntity> projects;
  final List<CompanyProjectEntity> clientProjects;
  final ProjectStatisticsEntity? statistics;
  final String? error;

  CompanyProjectState({
    this.isLoading = false,
    this.projects = const [],
    this.clientProjects = const [],
    this.statistics,
    this.error,
  });

  CompanyProjectState copyWith({
    bool? isLoading,
    List<CompanyProjectEntity>? projects,
    List<CompanyProjectEntity>? clientProjects,
    ProjectStatisticsEntity? statistics,
    String? error,
  }) {
    return CompanyProjectState(
      isLoading: isLoading ?? this.isLoading,
      projects: projects ?? this.projects,
      clientProjects: clientProjects ?? this.clientProjects,
      statistics: statistics ?? this.statistics,
      error: error,
    );
  }
}