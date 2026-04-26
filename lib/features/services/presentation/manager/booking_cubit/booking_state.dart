import 'package:plupool/features/services/domain/entities/booking_entity.dart';
import 'package:plupool/features/services/domain/entities/booking_list_entity.dart';

abstract class BookingState {}

class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {}

class BookingSuccess extends BookingState {
  final BookingListEntity data;
  BookingSuccess(this.data);
}

class BookingSingleLoaded extends BookingState {
  final BookingEntity booking;
  BookingSingleLoaded(this.booking);
}

class BookingUpdated extends BookingState {}

class BookingDeleted extends BookingState {}

class BookingError extends BookingState {
  final String message;
  BookingError(this.message);
}