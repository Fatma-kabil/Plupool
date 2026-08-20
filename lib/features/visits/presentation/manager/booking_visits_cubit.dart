import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/visits/domain/usecases/get_booking_visits_use_case.dart';
import 'package:plupool/features/visits/presentation/manager/visits-cubit/booking_visits_state.dart';

class BookingVisitsCubit extends Cubit<BookingVisitsState> {
  final GetBookingVisitsUseCase getBookingVisitsUseCase;

  BookingVisitsCubit({
    required this.getBookingVisitsUseCase,
  }) : super(BookingVisitsInitial());

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
}