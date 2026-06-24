import 'package:plupool/features/services/domain/entities/booking_entity.dart';
import 'package:plupool/features/services/domain/entities/booking_list_entity.dart';
import 'package:plupool/features/services/domain/entities/user_booking_entity.dart';
import 'package:plupool/features/services/domain/params/get_user_booking_params.dart';

abstract class BookingRepository {
  Future<BookingListEntity> getBookings({
    String? status,
    String? type,
    String? search,
  });

  Future<BookingEntity> getBookingDetails(int id);

  Future<BookingEntity> updateBooking({
    required int id,
    required BookingEntity booking,
  });
   Future<BookingEntity> addBooking({
  
    required BookingEntity booking,
  });

  Future<void> deleteBooking(int id);
  Future<List<UserBookingEntity>> getUserBookings(GetUserBookingsParams params);
}
