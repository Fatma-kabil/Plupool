import 'rating_entity.dart';

class RatingsEntity {
  final List<RatingEntity> ratings;
  final int total;
  final int page;
  final int limit;
  final int totalPages;

  RatingsEntity({
    required this.ratings,
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
  });
}