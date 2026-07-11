import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/maintenance/data/models/maintenance_booking_model.dart';
import 'package:plupool/features/maintenance/data/remote_data_source.dart/maintenance_remote_data_source.dart';
import 'package:plupool/features/maintenance/domain/entities/maintenance_booking_params.dart';
import 'package:plupool/features/maintenance/domain/entities/maintenance_service_entity.dart';
import 'package:plupool/features/maintenance/domain/repos/maintenance_repository.dart';

class MaintenanceRepositoryImpl implements MaintenanceRepository {
  final MaintenanceRemoteDataSource remoteDataSource;

  MaintenanceRepositoryImpl(this.remoteDataSource);

  @override
  Future<MaintenanceServiceEntity> getMaintenanceService() async {
    try {
      return await remoteDataSource.getMaintenanceService();
    } catch (e) {
      throw mapDioError(e);
    }
  }

  @override
  Future<void> bookMaintenance(MaintenanceBookingEntity booking) async {
    try {
      await remoteDataSource.bookMaintenance(
        MaintenanceBookingModel(
          bookingType: booking.bookingType,
          bookingDate: booking.bookingDate,
          bookingTime: booking.bookingTime,
          serviceId: booking.serviceId,
          packageId: booking.packageId,
        ),
      );
    } catch (e) {
      throw mapDioError(e);
    }
  }
}