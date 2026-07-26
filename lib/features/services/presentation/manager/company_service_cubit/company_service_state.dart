part of 'company_service_cubit.dart';

sealed class CompanyServiceState {}

final class CompanyServiceInitial extends CompanyServiceState {}

// Maintenance Services
final class GetMaintenanceServicesLoading extends CompanyServiceState {}

final class GetMaintenanceServicesSuccess extends CompanyServiceState {
  final List<CompanyServiceEntity> services;

  GetMaintenanceServicesSuccess(this.services);
}

final class GetMaintenanceServicesFailure extends CompanyServiceState {
  final String message;

  GetMaintenanceServicesFailure(this.message);
}

// Packages
final class GetServicesPackagesLoading extends CompanyServiceState {}

final class GetServicesPackagesSuccess extends CompanyServiceState {
  final List<CompanyServiceEntity> packages;

  GetServicesPackagesSuccess(this.packages);
}

final class GetServicesPackagesFailure extends CompanyServiceState {
  final String message;

  GetServicesPackagesFailure(this.message);
}