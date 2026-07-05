abstract class ConstructionBookingState {}

class ConstructionBookingInitial extends ConstructionBookingState {}

class ConstructionBookingLoading extends ConstructionBookingState {}

class ConstructionBookingSuccess extends ConstructionBookingState {}

class ConstructionBookingFailure extends ConstructionBookingState {
  final String message;

  ConstructionBookingFailure(this.message);
}