

import 'package:plupool/features/rating/domain/repos/ratings_repo.dart';

class RejectRatingUseCase {
  final RatingsRepository repo;

  RejectRatingUseCase(this.repo);

  Future<void> call(int id) {
    return repo.rejectRating(id);
  }
}