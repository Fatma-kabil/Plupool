import 'package:plupool/features/projects/domain/entities/our_project_entity.dart';



abstract class ProjectsState {}

class ProjectsInitial extends ProjectsState {}

class OurProjectsLoading extends ProjectsState {}

class OurProjectsSuccess extends ProjectsState {
  final List<OurProjectEntity> projects;

  OurProjectsSuccess(this.projects);
}

class OurProjectsError extends ProjectsState {
  final String message;

  OurProjectsError(this.message);
}