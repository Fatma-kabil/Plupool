import 'package:plupool/features/services/domain/entities/booking_entity.dart';
import 'package:plupool/features/services/domain/repos/booking_repo.dart';

class GetBookingDetailsUseCase {
  final BookingRepository repo;
  GetBookingDetailsUseCase(this.repo);

  Future<BookingEntity> call(int id) {
    return repo.getBookingDetails(id);
  }
}