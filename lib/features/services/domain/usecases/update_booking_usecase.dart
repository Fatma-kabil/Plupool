import 'package:plupool/features/services/domain/entities/booking_entity.dart';
import 'package:plupool/features/services/domain/repos/booking_repo.dart';

class UpdateBookingUseCase {
  final BookingRepository repo;
  UpdateBookingUseCase(this.repo);

  Future<BookingEntity> call({
    required int id,
    String? status,
    String? notes,
    String? nextDate,
    List<int>? technicianIds,
  }) {
    return repo.updateBooking(
      id: id,
      status: status,
      notes: notes,
      nextDate: nextDate,
      technicianIds: technicianIds,
    );
  }
}