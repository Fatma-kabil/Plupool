import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/tasks/domain/entities/technician_services_entity.dart';
import 'package:plupool/features/tasks/domain/repos/technician_services_repo.dart';

class GetTechnicianServicesUseCase {
  final TechnicianServicesRepo repo;

  GetTechnicianServicesUseCase(this.repo);

  Future<Either<Failure, TechnicianServicesEntity>> call({
    required int clientId,
    String? status,
  }) {
    return repo.getTechnicianServices(
      clientId: clientId,
      status: status,
    );
  }
}