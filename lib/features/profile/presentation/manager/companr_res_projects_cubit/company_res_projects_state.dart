
import 'package:plupool/features/profile/domain/entities/company_project_entity.dart';

sealed class CompanyProjectsState {
  const CompanyProjectsState();
}

final class CompanyProjectsInitial extends CompanyProjectsState {}

final class GetCompanyProjectsLoading extends CompanyProjectsState {}

final class GetCompanyProjectsSuccess extends CompanyProjectsState {
  final List<CompanyProjectEntity> projects;

  const GetCompanyProjectsSuccess(this.projects);
}

final class GetCompanyProjectsFailure extends CompanyProjectsState {
  final String message;

  const GetCompanyProjectsFailure(this.message);
}