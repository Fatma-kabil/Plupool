import 'package:plupool/features/rating/data/data_sources/ratings_remote_data_source.dart';
import 'package:plupool/features/rating/domain/entities/rating_entities.dart';
import 'package:plupool/features/rating/domain/repos/ratings_repo.dart';

import '../../domain/entities/rating_entity.dart';

class RatingsRepositoryImpl implements RatingsRepository {
  final RatingsRemoteDataSource remote;

  RatingsRepositoryImpl(this.remote);

  @override
  Future<RatingsEntity> getRatings({
    int page = 1,
    int limit = 20,
    String? search,
    String? status,
    String? sortBy,
    int? rating,
    int? serviceId,
  }) async {
    final result = await remote.getRatings(
      page: page,
      limit: limit,
      search: search,
      status: status,
      sortBy: sortBy,
      rating: rating,
      serviceId: serviceId,
    );

    return result;
  }

  @override
  Future<RatingEntity> getRatingById(int id) async {
    final result = await remote.getRatingById(id);
    return result;
  }

  @override
  Future<void> deleteRating(int id) async {
    await remote.deleteRating(id);
  }

  @override
  Future<void> approveRating(int id) async {
    await remote.approveRating(id);
  }

  @override
  Future<void> rejectRating(int id) async {
    await remote.rejectRating(id);
  }
}