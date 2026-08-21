import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/visits/domain/entities/reading_request_entity.dart';
import 'package:plupool/features/visits/domain/usecases/add_reading_use_case.dart';

import 'package:plupool/features/visits/domain/usecases/get_booking_visits_use_case.dart';
import 'package:plupool/features/visits/domain/usecases/update_latest_reading_use_case.dart';


import 'package:plupool/features/visits/presentation/manager/visits-cubit/booking_visits_state.dart';

class BookingVisitsCubit extends Cubit<BookingVisitsState> {
  final GetBookingVisitsUseCase getBookingVisitsUseCase;
  final AddReadingUseCase addVisitReadingUseCase;
  final UpdateLatestReadingUseCase updateLatestReadingUseCase;

  BookingVisitsCubit({
    required this.getBookingVisitsUseCase,
    required this.addVisitReadingUseCase,
    required this.updateLatestReadingUseCase,
  }) : super(BookingVisitsInitial());

  // =========================================================
  // Get Booking Visits
  // =========================================================

  Future<void> getBookingVisits({
    required int bookingId,
  }) async {
    emit(BookingVisitsLoading());

    final result = await getBookingVisitsUseCase(
      bookingId: bookingId,
    );

    result.fold(
      (failure) {
        emit(
          BookingVisitsError(
            message: failure.message,
          ),
        );
      },
      (data) {
        emit(
          BookingVisitsSuccess(
            data: data,
          ),
        );
      },
    );
  }

  // =========================================================
  // Add Reading
  // =========================================================

  Future<void> addReading({
    required int sourceBookingId,
    required int currentVisitBookingId,
    required ReadingRequestEntity reading,
  }) async {
    emit(AddReadingLoading());

    final result = await addVisitReadingUseCase(
      sourceBookingId: sourceBookingId,
      currentVisitBookingId: currentVisitBookingId,
      reading: reading,
    );

    result.fold(
      (failure) async {
        emit(
          AddReadingError(
            message: failure.message,
          ),
        );

        // حتى لو فشل الـ POST
        // نجيب الداتا من جديد
        await getBookingVisits(
          bookingId: sourceBookingId,
        );
      },
      (_) async {
        emit(
          const AddReadingSuccess(),
        );

        // بعد النجاح نجيب الداتا الجديدة
        await getBookingVisits(
          bookingId: sourceBookingId,
        );
      },
    );
  }

  // =========================================================
  // Update Latest Reading
  // =========================================================

  Future<void> updateLatestReading({
    required int sourceBookingId,
    required int selectedVisitBookingId,
    required ReadingRequestEntity reading,
  }) async {
    emit(UpdateLatestReadingLoading());

    final result = await updateLatestReadingUseCase(
      sourceBookingId: sourceBookingId,
      selectedVisitBookingId:
          selectedVisitBookingId,
      reading: reading,
    );

    result.fold(
      (failure) async {
        emit(
          UpdateLatestReadingError(
            message: failure.message,
          ),
        );

        // حتى لو فشل الـ PATCH
        // نجيب الداتا من جديد
        await getBookingVisits(
          bookingId: sourceBookingId,
        );
      },
      (_) async {
        emit(
          const UpdateLatestReadingSuccess(),
        );

        // بعد النجاح نجيب الداتا الجديدة
        await getBookingVisits(
          bookingId: sourceBookingId,
        );
      },
    );
  }
}