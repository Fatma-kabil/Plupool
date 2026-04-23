import 'package:plupool/features/rating/domain/entities/rating_entities.dart';

import '../entities/rating_entity.dart';

abstract class RatingsRepository {
  Future<RatingsEntity> getRatings({
    int page,
    int limit,
    String? search,
    String? status,
    String? sortBy,
    int? rating,
    int? serviceId,
  });

  Future<RatingEntity> getRatingById(int id);

  Future<void> deleteRating(int id);

  Future<void> approveRating(int id);

  Future<void> rejectRating(int id);
}