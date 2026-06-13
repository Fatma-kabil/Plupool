import 'package:plupool/features/services/domain/entities/user_booking_entity.dart';
import 'package:plupool/features/services/domain/params/get_user_booking_params.dart';
import 'package:plupool/features/services/domain/repos/booking_repo.dart';

class GetUserBookingsUseCase {
  final BookingRepository repository;

  GetUserBookingsUseCase(this.repository);

  Future<List<UserBookingEntity>> call(GetUserBookingsParams params) {
    return repository.getUserBookings(params);
  }
}
