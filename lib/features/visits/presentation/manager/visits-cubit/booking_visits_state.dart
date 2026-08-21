import 'package:equatable/equatable.dart';
import 'package:plupool/features/visits/domain/entities/booking_visits_entity.dart';

abstract class BookingVisitsState extends Equatable {
  const BookingVisitsState();

  @override
  List<Object?> get props => [];
}

// ================= Initial =================

class BookingVisitsInitial extends BookingVisitsState {}

// ================= Get Visits =================

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

// ================= Add Reading =================

class AddReadingLoading extends BookingVisitsState {}

class AddReadingSuccess extends BookingVisitsState {
  final String message;

  const AddReadingSuccess({
    this.message = 'تم إضافة القراءة بنجاح',
  });

  @override
  List<Object?> get props => [message];
}

class AddReadingError extends BookingVisitsState {
  final String message;

  const AddReadingError({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}

// ================= Update Latest Reading =================

class UpdateLatestReadingLoading extends BookingVisitsState {}

class UpdateLatestReadingSuccess extends BookingVisitsState {
  final String message;

  const UpdateLatestReadingSuccess({
    this.message = 'تم تعديل آخر قراءة بنجاح',
  });

  @override
  List<Object?> get props => [message];
}

class UpdateLatestReadingError extends BookingVisitsState {
  final String message;

  const UpdateLatestReadingError({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}