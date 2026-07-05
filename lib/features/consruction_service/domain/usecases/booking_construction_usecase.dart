import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/consruction_service/domain/entities/construction_booking_entity.dart';
import 'package:plupool/features/consruction_service/domain/repos/construction_booking_repo.dart';

class BookConstructionUseCase {
  final ConstructionBookingRepo repository;

  BookConstructionUseCase(this.repository);

  Future<Either<Failure, Unit>> call(
    ConstructionBookingEntity entity,
  ) {
    return repository.bookConstruction(entity);
  }
}