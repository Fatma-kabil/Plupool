import 'package:plupool/features/maintenance/data/models/maintenance_booking_model.dart';
import 'package:plupool/features/maintenance/data/remote_data_source.dart/maintenance_remote_data_source.dart';
import 'package:plupool/features/maintenance/domain/entities/maintenance_booking_params.dart';
import 'package:plupool/features/maintenance/domain/repos/maintenance_repository.dart';

import '../../domain/entities/maintenance_service_entity.dart';

class MaintenanceRepositoryImpl implements MaintenanceRepository {
  final MaintenanceRemoteDataSource remoteDataSource;

  MaintenanceRepositoryImpl(this.remoteDataSource);

  @override
  Future<MaintenanceServiceEntity> getMaintenanceService() async {
    return await remoteDataSource.getMaintenanceService();
  }

  @override
  Future<void> bookMaintenance(MaintenanceBookingEntity booking) async {
    await remoteDataSource.bookMaintenance(
      MaintenanceBookingModel(
        bookingType: booking.bookingType,
        bookingDate: booking.bookingDate,
        bookingTime: booking.bookingTime,
        serviceId: booking.serviceId,
        packageId: booking.packageId
        
      ),
    );
  }
}
