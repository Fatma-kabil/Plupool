import 'package:plupool/features/services/domain/repos/booking_repo.dart';

class DeleteBookingUseCase {
  final BookingRepository repo;
  DeleteBookingUseCase(this.repo);

  Future<void> call(int id) {
    return repo.deleteBooking(id);
  }
}