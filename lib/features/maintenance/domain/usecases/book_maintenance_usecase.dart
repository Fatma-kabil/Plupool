import 'package:plupool/features/maintenance/domain/entities/maintenance_booking_params.dart';
import 'package:plupool/features/maintenance/domain/repos/maintenance_repository.dart';

class BookMaintenanceUseCase {
  final MaintenanceRepository repository;

  BookMaintenanceUseCase(this.repository);

  Future<void> call(
    MaintenanceBookingEntity booking,
  ) {
    return repository.bookMaintenance(booking);
  }
}