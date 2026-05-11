abstract class TechRatingState {}

class TechRatingInitial extends TechRatingState {}

class TechRatingLoading extends TechRatingState {}

class TechRatingSuccess extends TechRatingState {
  final String message;

  TechRatingSuccess(this.message);
}

class TechRatingError extends TechRatingState {
  final String message;

  TechRatingError(this.message);
}