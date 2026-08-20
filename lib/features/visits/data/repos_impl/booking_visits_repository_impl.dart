import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/visits/data/remote_data_source/booking_visits_remote_data_source.dart';
import 'package:plupool/features/visits/domain/entities/booking_visits_entity.dart';
import 'package:plupool/features/visits/domain/entities/booking_visits_repository.dart';

class BookingVisitsRepositoryImpl
    implements BookingVisitsRepository {
  final BookingVisitsRemoteDataSource remoteDataSource;

  BookingVisitsRepositoryImpl({
    required this.remoteDataSource,
  });

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
         mapDioError(e)
      );
    }
  }
}