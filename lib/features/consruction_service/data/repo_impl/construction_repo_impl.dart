import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/consruction_service/data/models/construction_booking_model.dart';
import 'package:plupool/features/consruction_service/data/remote_data_source/construction_remote_data_source.dart';
import 'package:plupool/features/consruction_service/domain/entities/construction_booking_entity.dart';
import 'package:plupool/features/consruction_service/domain/repos/construction_booking_repo.dart';

class ConstructionRepoImpl implements ConstructionBookingRepo{
  final ConstructionRemoteDataSource remoteDataSource;

  ConstructionRepoImpl(this.remoteDataSource);
@override
Future<Either<Failure, Unit>> bookConstruction(
  ConstructionBookingEntity entity,
) async {
  try {
    final model = ConstructionBookingModel(
      bookingType: entity.bookingType,
      bookingDate: entity.bookingDate,
      bookingTime: entity.bookingTime,
      poolTypeId: entity.poolTypeId,
      customLength: entity.customLength,
      customWidth: entity.customWidth,
      customDepth: entity.customDepth,
      notes: entity.notes,
    );

    await remoteDataSource.bookConstruction(model);

    return right(unit);
  }  on Failure catch (e) {
      return Left(e);
    }
}

}