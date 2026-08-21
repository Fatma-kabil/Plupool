import 'package:dartz/dartz.dart';

import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/visits/domain/entities/booking_visits_entity.dart';
import 'package:plupool/features/visits/domain/entities/reading_request_entity.dart';

abstract class BookingVisitsRepository {
  // ================= Get Visits =================

  Future<Either<Failure, BookingVisitsEntity>> getBookingVisits({
    required int bookingId,
  });

  // ================= Add Reading =================

  Future<Either<Failure, void>> addReading({
    required int sourceBookingId,
    required int currentVisitBookingId,
    required ReadingRequestEntity reading,
  });

  // ================= Update Latest Reading =================

  Future<Either<Failure, void>> updateLatestReading({
    required int sourceBookingId,
    required int latestCompletedVisitBookingId,
    required ReadingRequestEntity reading,
  });
}