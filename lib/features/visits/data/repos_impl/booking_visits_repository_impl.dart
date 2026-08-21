import 'package:dartz/dartz.dart';

import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/visits/data/models/reading_request_model.dart';
import 'package:plupool/features/visits/data/remote_data_source/booking_visits_remote_data_source.dart';
import 'package:plupool/features/visits/domain/entities/booking_visits_entity.dart';
import 'package:plupool/features/visits/domain/entities/reading_request_entity.dart';
import 'package:plupool/features/visits/domain/repos/booking_visits_repository.dart';

class BookingVisitsRepositoryImpl
    implements BookingVisitsRepository {
  final BookingVisitsRemoteDataSource remoteDataSource;

  BookingVisitsRepositoryImpl({
    required this.remoteDataSource,
  });

  // ================= Get Visits =================

  @override
  Future<Either<Failure, BookingVisitsEntity>> getBookingVisits({
    required int bookingId,
  }) async {
    try {
      final result = await remoteDataSource.getBookingVisits(
        bookingId: bookingId,
      );

      return Right(result);
    } catch (e) {
      return Left(
        mapDioError(e),
      );
    }
  }

  // ================= Add Reading =================

  @override
  Future<Either<Failure, void>> addReading({
    required int sourceBookingId,
    required int currentVisitBookingId,
    required ReadingRequestEntity reading,
  }) async {
    try {
      final model = ReadingRequestModel(
        visitNumber: reading.visitNumber,
        status: reading.status,
        chlorinePpm: reading.chlorinePpm,
        phLevel: reading.phLevel,
        temperatureC: reading.temperatureC,
        notes: reading.notes,
        technicianId: reading.technicianId,
      );

      await remoteDataSource.addReading(
        sourceBookingId: sourceBookingId,
        currentVisitBookingId: currentVisitBookingId,
        model: model,
      );

      return const Right(null);
    } catch (e) {
      return Left(
        mapDioError(e),
      );
    }
  }

  // ================= Update Latest Reading =================

  @override
  Future<Either<Failure, void>> updateLatestReading({
    required int sourceBookingId,
    required int latestCompletedVisitBookingId,
    required ReadingRequestEntity reading,
  }) async {
    try {
      final model = ReadingRequestModel(
        visitNumber: reading.visitNumber,
        status: reading.status,
        chlorinePpm: reading.chlorinePpm,
        phLevel: reading.phLevel,
        temperatureC: reading.temperatureC,
        notes: reading.notes,
        technicianId: reading.technicianId,
      );

      await remoteDataSource.updateLatestReading(
        sourceBookingId: sourceBookingId,
        latestCompletedVisitBookingId:
            latestCompletedVisitBookingId,
        model: model,
      );

      return const Right(null);
    } catch (e) {
      return Left(
        mapDioError(e),
      );
    }
  }
}