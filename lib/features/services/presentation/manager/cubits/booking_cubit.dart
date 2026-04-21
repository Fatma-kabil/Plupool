import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/services/domain/entities/booking_list_entity.dart';
import 'package:plupool/features/services/domain/usecases/get_booking_details.dart';
import 'package:plupool/features/services/domain/usecases/get_bookings_usecase.dart';
import 'package:plupool/features/services/domain/usecases/update_booking_usecase.dart';
import 'package:plupool/features/services/domain/usecases/delete_booking_usecase.dart';
import 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final GetBookingsUseCase getBookingsUseCase;
  final GetBookingDetailsUseCase getDetailsUseCase;
  final UpdateBookingUseCase updateUseCase;
  final DeleteBookingUseCase deleteUseCase;

  BookingCubit({
    required this.getBookingsUseCase,
    required this.getDetailsUseCase,
    required this.updateUseCase,
    required this.deleteUseCase,
  }) : super(BookingInitial());

  // 🔥 filters cache
  String? _status;
  String? _type;
  String? _search;

  // 🔥 cached data
  BookingListEntity? _cachedData;

  /// ================= GET ALL =================
  Future<void> getBookings({
    String? status,
    String? type,
    String? search,
  }) async {
    try {
      emit(BookingLoading());

      _status = status;
      _type = type;
      _search = search;

      final result = await getBookingsUseCase(
        status: status,
        type: type,
        search: search,
      );

      _cachedData = result;

      emit(BookingSuccess(result));
    } catch (e) {
      emit(BookingError(
        e is Failure ? e.message : "حدث خطأ غير متوقع",
      ));
    }
  }

  /// ================= GET SINGLE =================
  Future<void> getBooking(int id) async {
    try {
      emit(BookingLoading());

      final booking = await getDetailsUseCase(id);

      emit(BookingSingleLoaded(booking));
    } catch (e) {
      emit(BookingError(
        e is Failure ? e.message : "حدث خطأ غير متوقع",
      ));
    }
  }

  /// ================= UPDATE =================
  Future<void> updateBooking({
    required int id,
    String? status,
    String? notes,
    String? nextDate,
    List<int>? technicianIds,
  }) async {
    try {
      emit(BookingLoading());

      await updateUseCase(
        id: id,
        status: status,
        notes: notes,
        nextDate: nextDate,
        technicianIds: technicianIds,
      );

      final result = await getBookingsUseCase(
        status: _status,
        type: _type,
        search: _search,
      );

      _cachedData = result;

      emit(BookingUpdated());
      emit(BookingSuccess(result));
    } catch (e) {
      emit(BookingError(
        e is Failure ? e.message : "حدث خطأ غير متوقع",
      ));

      if (_cachedData != null) {
        emit(BookingSuccess(_cachedData!));
      }
    }
  }

  /// ================= DELETE =================
  Future<void> deleteBooking(int id) async {
    try {
      emit(BookingLoading());

      await deleteUseCase(id);

      final result = await getBookingsUseCase(
        status: _status,
        type: _type,
        search: _search,
      );

      _cachedData = result;

      emit(BookingDeleted());
      emit(BookingSuccess(result));
    } catch (e) {
      emit(BookingError(
        e is Failure ? e.message : "حدث خطأ غير متوقع",
      ));

      if (_cachedData != null) {
        emit(BookingSuccess(_cachedData!));
      }
    }
  }
}