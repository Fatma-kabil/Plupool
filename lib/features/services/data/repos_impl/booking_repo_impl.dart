import 'package:plupool/features/services/data/mapper/booking_mapper.dart';
import 'package:plupool/features/services/data/remote_data_source/booking_remote_data_source.dart';
import 'package:plupool/features/services/domain/entities/booking_entity.dart';
import 'package:plupool/features/services/domain/entities/booking_list_entity.dart';
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
    return  res.toEntity();
  }

  @override
  Future<BookingEntity> updateBooking({
    required int id,
    String? status,
    String? notes,
    String? nextDate,
    List<int>? technicianIds,
  }) async {
    final res = await remote.updateBooking(
      id: id,
      status: status,
      notes: notes,
      nextDate: nextDate,
      technicianIds: technicianIds,
    );

    return res.toEntity();
  }

  @override
  Future<void> deleteBooking(int id) {
    return remote.deleteBooking(id);
  }
}
