import 'package:plupool/features/projects/domain/entities/our_project_entity.dart';

class OurProjectsState {
  final bool isLoading;
  final bool isDeleting;
  final List<OurProjectEntity> projects;
  final String? error;

  const OurProjectsState({
    this.isLoading = false,
    this.isDeleting = false,
    this.projects = const [],
    this.error,
  });

  OurProjectsState copyWith({
    bool? isLoading,
    bool? isDeleting,
    List<OurProjectEntity>? projects,
    String? error,
  }) {
    return OurProjectsState(
      isLoading: isLoading ?? this.isLoading,
      isDeleting: isDeleting ?? this.isDeleting,
      projects: projects ?? this.projects,
      error: error,
    );
  }
}