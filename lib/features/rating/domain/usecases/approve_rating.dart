

import 'package:plupool/features/rating/domain/repos/ratings_repo.dart';

class ApproveRatingUseCase {
  final RatingsRepository repo;

  ApproveRatingUseCase(this.repo);

  Future<void> call(int id) {
    return repo.approveRating(id);
  }
}