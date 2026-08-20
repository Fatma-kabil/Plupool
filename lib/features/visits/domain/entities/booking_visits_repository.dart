import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/visits/domain/entities/booking_visits_entity.dart';

abstract class BookingVisitsRepository {
  Future<Either<Failure, BookingVisitsEntity>> getBookingVisits({
    required int bookingId,
  });
}