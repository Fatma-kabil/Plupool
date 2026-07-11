import 'package:plupool/features/home/domain/entities/add_rating_entity.dart';

abstract class RatingState {}

class RatingInitial extends RatingState {}

class RatingLoading extends RatingState {}

class RatingSuccess extends RatingState {
  final AddRatingEntity rating;

  RatingSuccess(this.rating);
}

class RatingError extends RatingState {
  final String message;

  RatingError(this.message);
}