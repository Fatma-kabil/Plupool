import 'package:plupool/features/projects/domain/entities/our_project_entity.dart';

class OurProjectsState {
  final bool isLoading;
  final bool isDeleting;
  final bool isUpdating;

  final List<OurProjectEntity> projects;

  final String? error;

  const OurProjectsState({
    this.isLoading = false,
    this.isDeleting = false,
    this.isUpdating = false,
    this.projects = const [],
    this.error,
  });

  OurProjectsState copyWith({
    bool? isLoading,
    bool? isDeleting,
    bool? isUpdating,
    List<OurProjectEntity>? projects,
    String? error,
  }) {
    return OurProjectsState(
      isLoading: isLoading ?? this.isLoading,
      isDeleting: isDeleting ?? this.isDeleting,
      isUpdating: isUpdating ?? this.isUpdating,
      projects: projects ?? this.projects,
      error: error,
    );
  }
}