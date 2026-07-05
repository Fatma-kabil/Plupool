 import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/consruction_service/domain/entities/construction_booking_entity.dart';

abstract  class ConstructionBookingRepo {
  Future<Either<Failure, Unit>> bookConstruction(
  ConstructionBookingEntity entity,
);
}