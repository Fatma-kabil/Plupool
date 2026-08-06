import 'package:plupool/features/tasks/domain/entities/technician_services_entity.dart';

class TechnicianServicesState {}

class TechnicianServicesInitial extends TechnicianServicesState {}

class GetTechnicianServicesLoading extends TechnicianServicesState {}

class GetTechnicianServicesSuccess extends TechnicianServicesState {
  final TechnicianServicesEntity services;

  GetTechnicianServicesSuccess(this.services);
}

class GetTechnicianServicesFailure extends TechnicianServicesState {
  final String message;

  GetTechnicianServicesFailure(this.message);
}