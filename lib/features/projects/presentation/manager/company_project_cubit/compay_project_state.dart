import 'package:plupool/features/projects/domain/entities/company_project_entity.dart';

abstract class CompanyProjectState {}

class CompanyProjectsInitial extends CompanyProjectState {}

class CompanyProjectsLoading extends CompanyProjectState {}

class CompanyProjectsSuccess extends CompanyProjectState {
  final List<CompanyProjectEntity> projects;

  CompanyProjectsSuccess(this.projects);
}

class CompanyProjectsError extends CompanyProjectState {
  final String message;

  CompanyProjectsError(this.message);
}
