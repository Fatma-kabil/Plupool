import 'package:equatable/equatable.dart';
import 'package:plupool/features/visits/domain/entities/booking_visits_entity.dart';

abstract class BookingVisitsState extends Equatable {
  const BookingVisitsState();

  @override
  List<Object?> get props => [];
}

class BookingVisitsInitial extends BookingVisitsState {}

class BookingVisitsLoading extends BookingVisitsState {}

class BookingVisitsSuccess extends BookingVisitsState {
  final BookingVisitsEntity data;

  const BookingVisitsSuccess({
    required this.data,
  });

  @override
  List<Object?> get props => [data];
}

class BookingVisitsError extends BookingVisitsState {
  final String message;

  const BookingVisitsError({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}