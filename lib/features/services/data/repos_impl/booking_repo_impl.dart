import 'package:plupool/features/services/data/mapper/booking_mapper.dart';
import 'package:plupool/features/services/data/remote_data_source/booking_remote_data_source.dart';
import 'package:plupool/features/services/domain/entities/booking_entity.dart';
import 'package:plupool/features/services/domain/entities/booking_list_entity.dart';
import 'package:plupool/features/services/domain/entities/user_booking_entity.dart';
import 'package:plupool/features/services/domain/params/get_user_booking_params.dart';
import 'package:plupool/features/services/domain/repos/booking_repo.dart';

class BookingRepositoryImpl implements BookingRepository {
  final BookingRemoteDataSource remote;

  BookingRepositoryImpl(this.remote);

  @override
  Future<BookingListEntity> getBookings({
    String? status,
    String? type,
    String? search,
  }) async {
    final res = await remote.getBookings(
      status: status,
      type: type,
      search: search,
    );

    return res.toEntity();
  }

  @override
  Future<BookingEntity> getBookingDetails(int id) async {
    final res = await remote.getBookingDetails(id);
    return res.toEntity();
  }

  @override
  Future<BookingEntity> updateBooking({
    required int id,
    required BookingEntity booking,
  }) async {
    final res = await remote.updateBooking(id: id, booking: booking.toModel());

    return res.toEntity();
  }

  @override
  Future<BookingEntity> addBooking({
    
    required BookingEntity booking,
  }) async {
    final res = await remote.addBooking( booking: booking.toModel());

    return res.toEntity();
  }

  @override
  Future<void> deleteBooking(int id) {
    return remote.deleteBooking(id);
  }

  @override
  Future<List<UserBookingEntity>> getUserBookings(
    GetUserBookingsParams params,
  ) async {
    final result = await remote.getUserBookings(params);

    return result.map((e) => e.toEntity()).toList();
  }
}
