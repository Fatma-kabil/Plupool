import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import '../models/rating_model.dart';
import '../models/ratings_response_model.dart';

class RatingsRemoteDataSource {
  final ApiService api;

  RatingsRemoteDataSource(this.api);

  Future<RatingsResponseModel> getRatings({
    int page = 1,
    int limit = 20,
    String? search,
    String? status,
    String? sortBy = "newest",
    int? rating,
    int? serviceId,
  }) async {
    final response = await api.get(
      Endpoints.ratings,
      queryParams: {
        'page': page,
        'limit': limit,
        'search': search,
        'status': status,
        'sort_by': sortBy,
        'rating': rating,
        'service_id': serviceId,
      }..removeWhere((k, v) => v == null),
    );

    return RatingsResponseModel.fromJson(response.data);
  }

  Future<RatingModel> getRatingById(int id) async {
    final response = await api.get('${Endpoints.ratings}/$id');
    return RatingModel.fromJson(response.data);
  }

  Future<void> deleteRating(int id) async {
    await api.delete('${Endpoints.ratings}/$id');
  }

  Future<void> approveRating(int id) async {
    await api.put('${Endpoints.ratings}/$id/approve');
  }

  Future<void> rejectRating(int id) async {
    await api.put('${Endpoints.ratings}/$id/reject');
  }
}
