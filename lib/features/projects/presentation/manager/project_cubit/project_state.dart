import 'package:plupool/features/projects/domain/entities/our_project_entity.dart';

class OurProjectsState {
  final bool isLoading;
  final bool isDeleting;
  final bool isUpdating;
  final bool updateSuccess;
  final bool isAdding;
  final bool addSuccess;

  final List<OurProjectEntity> projects;
  final String? error;

  const OurProjectsState({
    this.isLoading = false,
    this.isDeleting = false,
    this.isUpdating = false,
    this.isAdding = false,
    this.updateSuccess = false,
    this.addSuccess = false,
    this.projects = const [],
    this.error,
  });

  OurProjectsState copyWith({
    bool? isLoading,
    bool? isDeleting,
    bool? isUpdating,
    bool? isAdding,
    bool? updateSuccess,
    bool? addSuccess,
    List<OurProjectEntity>? projects,
    String? error,
  }) {
    return OurProjectsState(
      isLoading: isLoading ?? this.isLoading,
      isDeleting: isDeleting ?? this.isDeleting,
      isUpdating: isUpdating ?? this.isUpdating,
      isAdding: isAdding ?? this.isAdding,
      updateSuccess: updateSuccess ?? this.updateSuccess,
      addSuccess: addSuccess ?? this.addSuccess,
      projects: projects ?? this.projects,
      error: error,
    );
  }
}
