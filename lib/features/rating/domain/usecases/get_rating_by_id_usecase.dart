import 'package:plupool/features/rating/domain/repos/ratings_repo.dart';

import '../entities/rating_entity.dart';

class GetRatingByIdUseCase {
  final RatingsRepository repo;

  GetRatingByIdUseCase(this.repo);

  Future<RatingEntity> call(int id) {
    return repo.getRatingById(id);
  }
}