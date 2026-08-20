import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/visits/domain/entities/booking_visits_entity.dart';
import 'package:plupool/features/visits/domain/entities/booking_visits_repository.dart';

class GetBookingVisitsUseCase {
  final BookingVisitsRepository repository;

  GetBookingVisitsUseCase({
    required this.repository,
  });

  Future<Either<Failure, BookingVisitsEntity>> call({
    required int bookingId,
  }) async {
    return await repository.getBookingVisits(
      bookingId: bookingId,
    );
  }
}