import 'package:dartz/dartz.dart';

import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/visits/domain/entities/reading_request_entity.dart';
import 'package:plupool/features/visits/domain/repos/booking_visits_repository.dart';

class UpdateLatestReadingUseCase {
  final BookingVisitsRepository repository;

  UpdateLatestReadingUseCase({
    required this.repository,
  });

  Future<Either<Failure, void>> call({
    required int sourceBookingId,
    required int selectedVisitBookingId,
    required ReadingRequestEntity reading,
  }) async {
    return await repository.updateLatestReading(
      sourceBookingId: sourceBookingId,
      selectedVisitBookingId:
          selectedVisitBookingId,
      reading: reading,
    );
  }
}