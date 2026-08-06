import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/tasks/domain/entities/technician_services_entity.dart';

abstract class TechnicianServicesRepo {
  Future<Either<Failure, TechnicianServicesEntity>>
      getTechnicianServices({
    required int clientId,
    String? status,
  });
}