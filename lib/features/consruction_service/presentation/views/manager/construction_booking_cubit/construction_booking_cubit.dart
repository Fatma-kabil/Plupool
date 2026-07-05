import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/consruction_service/domain/entities/construction_booking_entity.dart';
import 'package:plupool/features/consruction_service/domain/usecases/booking_construction_usecase.dart';
import 'construction_booking_state.dart';

class ConstructionBookingCubit extends Cubit<ConstructionBookingState> {
  ConstructionBookingCubit(this.bookConstructionUseCase)
      : super(ConstructionBookingInitial());

  final BookConstructionUseCase bookConstructionUseCase;

  Future<void> bookConstruction({
    required String bookingType,
    required String bookingDate,
    required String bookingTime,
    required int poolTypeId,
    double? customLength,
    double? customWidth,
    double? customDepth,
    String? notes,
  }) async {
    emit(ConstructionBookingLoading());

    final result = await bookConstructionUseCase(
      ConstructionBookingEntity(
        bookingType: bookingType,
        bookingDate: bookingDate,
        bookingTime: bookingTime,
        poolTypeId: poolTypeId,
        customLength: customLength,
        customWidth: customWidth,
        customDepth: customDepth,
        notes: notes,
      ),
    );

    result.fold(
      (failure) => emit(
        ConstructionBookingFailure(failure.message),
      ),
      (_) => emit(
        ConstructionBookingSuccess(),
      ),
    );
  }
}