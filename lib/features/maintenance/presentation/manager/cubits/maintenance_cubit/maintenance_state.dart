import 'package:plupool/features/maintenance/domain/entities/maintenance_service_entity.dart';


abstract class MaintenanceState {}

class MaintenanceInitial extends MaintenanceState {}

class MaintenanceLoading extends MaintenanceState {}

class MaintenanceLoaded extends MaintenanceState {
  final MaintenanceServiceEntity service;

  MaintenanceLoaded(this.service);
}

class MaintenanceError extends MaintenanceState {
  final String message;

  MaintenanceError(this.message);
}