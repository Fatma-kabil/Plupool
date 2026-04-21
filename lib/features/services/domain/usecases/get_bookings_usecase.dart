import 'package:plupool/features/services/domain/entities/booking_list_entity.dart';
import 'package:plupool/features/services/domain/repos/booking_repo.dart';

class GetBookingsUseCase {
  final BookingRepository repo;
  GetBookingsUseCase(this.repo);

  Future<BookingListEntity> call({
    String? status,
    String? type,
    String? search,
  }) {
    return repo.getBookings(
      status: status,
      type: type,
      search: search,
    );
  }
}