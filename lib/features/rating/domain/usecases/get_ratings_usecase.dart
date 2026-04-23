

import 'package:plupool/features/rating/domain/entities/rating_entities.dart';
import 'package:plupool/features/rating/domain/repos/ratings_repo.dart';

class GetRatingsUseCase {
  final RatingsRepository repo;

  GetRatingsUseCase(this.repo);

  Future<RatingsEntity> call({
    int page = 1,
    int limit = 20,
    String? search,
    String? status,
    String? sortBy,
    int? rating,
    int? serviceId,
  }) {
    return repo.getRatings(
      page: page,
      limit: limit,
      search: search,
      status: status,
      sortBy: sortBy,
      rating: rating,
      serviceId: serviceId,
    );
  }
}