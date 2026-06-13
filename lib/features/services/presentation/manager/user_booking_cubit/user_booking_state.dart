import 'package:equatable/equatable.dart';
import 'package:plupool/features/services/domain/entities/user_booking_entity.dart';

abstract class UserBookingState extends Equatable {
  const UserBookingState();

  @override
  List<Object?> get props => [];
}

class UserBookingInitial extends UserBookingState {}

class UserBookingLoading extends UserBookingState {}

class UserBookingLoaded extends UserBookingState {
  final List<UserBookingEntity> services;
  final List<UserBookingEntity> packages;

  const UserBookingLoaded({
    required this.services,
    required this.packages,
  });

  @override
  List<Object?> get props => [services, packages];
}

class UserBookingError extends UserBookingState {
  final String message;

  const UserBookingError(this.message);

  @override
  List<Object?> get props => [message];
}