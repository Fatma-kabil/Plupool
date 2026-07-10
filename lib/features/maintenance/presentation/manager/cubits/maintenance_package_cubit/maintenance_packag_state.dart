import 'package:plupool/features/maintenance/domain/entities/maintenance_package_entity.dart';

abstract class MaintenancePackagesState {}

class MaintenancePackagesInitial extends MaintenancePackagesState {}

class MaintenancePackagesLoading extends MaintenancePackagesState {}

class MaintenancePackagesLoaded extends MaintenancePackagesState {
  final List<MaintenancePackageEntity> packages;

  MaintenancePackagesLoaded(this.packages);
}

class MaintenancePackagesError extends MaintenancePackagesState {
  final String message;

  MaintenancePackagesError(this.message);
}

class MaintenancePackageBookingLoading extends MaintenancePackagesState {}

class MaintenancePackageBookingSuccess extends MaintenancePackagesState {}

class MaintenancePackageBookingError extends MaintenancePackagesState {
  final String message;

  MaintenancePackageBookingError(this.message);
}