import 'package:plupool/features/services/domain/entities/booking_entity.dart';
import 'package:plupool/features/services/domain/repos/booking_repo.dart';

class AddBookingUseCase {
  final BookingRepository repo;
  AddBookingUseCase(this.repo);

  Future<BookingEntity> call({required BookingEntity booking}) {
    return repo.addBooking(booking: booking);
  }
}
