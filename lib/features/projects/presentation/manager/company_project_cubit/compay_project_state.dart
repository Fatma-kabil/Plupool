import 'package:plupool/features/projects/domain/entities/company_project_entity.dart';
import 'package:plupool/features/projects/domain/entities/projects_statistics_entity.dart';

class CompanyProjectState {
  final bool isLoading;
  final bool isDeleting;
  final bool isUpdating;
  final bool updateSuccess;

  final bool isAdding;
  final bool addSuccess;

  final List<CompanyProjectEntity> projects;
  final List<CompanyProjectEntity> clientProjects;
  final ProjectStatisticsEntity? statistics;
  final String? error;

  const CompanyProjectState({
    this.isLoading = false,
    this.isDeleting = false,
    this.isUpdating = false,
    this.updateSuccess = false,
    this.isAdding = false,
    this.addSuccess = false,
    this.projects = const [],
    this.clientProjects = const [],
    this.statistics,
    this.error,
  });

  CompanyProjectState copyWith({
    bool? isLoading,
    bool? isDeleting,
    bool? isUpdating,
    bool? updateSuccess,
    bool? isAdding,
    bool? addSuccess,
    List<CompanyProjectEntity>? projects,
    List<CompanyProjectEntity>? clientProjects,
    ProjectStatisticsEntity? statistics,
    String? error,
  }) {
    return CompanyProjectState(
      isLoading: isLoading ?? this.isLoading,
      isDeleting: isDeleting ?? this.isDeleting,
      isUpdating: isUpdating ?? this.isUpdating,
      updateSuccess: updateSuccess ?? this.updateSuccess,
      isAdding: isAdding ?? this.isAdding,
      addSuccess: addSuccess ?? this.addSuccess,
      projects: projects ?? this.projects,
      clientProjects: clientProjects ?? this.clientProjects,
      statistics: statistics ?? this.statistics,
      error: error,
    );
  }
}