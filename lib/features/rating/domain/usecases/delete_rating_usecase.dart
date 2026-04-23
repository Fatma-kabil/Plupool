

import 'package:plupool/features/rating/domain/repos/ratings_repo.dart';

class DeleteRatingUseCase {
  final RatingsRepository repo;

  DeleteRatingUseCase(this.repo);

  Future<void> call(int id) {
    return repo.deleteRating(id);
  }
}