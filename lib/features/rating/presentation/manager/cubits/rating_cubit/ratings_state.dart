import 'package:plupool/features/rating/domain/entities/rating_entity.dart';



abstract class RatingsState {}

class RatingsInitial extends RatingsState {}

class RatingsLoading extends RatingsState {}

class RatingsSuccess extends RatingsState {
  final List<RatingEntity> ratings;

  RatingsSuccess(this.ratings);
}

class RatingsError extends RatingsState {
  final String message;

  RatingsError(this.message);
}

/// 🔍 details
class RatingDetailsLoading extends RatingsState {}

class RatingDetailsSuccess extends RatingsState {
  final RatingEntity rating;

  RatingDetailsSuccess(this.rating);
}

class RatingDetailsError extends RatingsState {
  final String message;

  RatingDetailsError(this.message);
}

/// 🔥 delete
class RatingsDeleting extends RatingsState {}

class RatingsDeleteSuccess extends RatingsState {}

class RatingsDeleteError extends RatingsState {
  final String message;

  RatingsDeleteError(this.message);
}

/// 🔥 approve / reject
class RatingsActionSuccess extends RatingsState {}

class RatingsActionError extends RatingsState {
  final String message;

  RatingsActionError(this.message);
}