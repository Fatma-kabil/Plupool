import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/technicains/data/models/update_tech_rating_request.dart';

class RatingsTechRemoteDataSource {
  final ApiService apiService;

  RatingsTechRemoteDataSource({required this.apiService});

  Future<String> updateTechRating({
    required int userId,
 
    required UpdateTechRatingRequest request,
  }) async {
    final response = await apiService.patch(
      '${Endpoints.users}/$userId/average-rating',

      data: request.toJson(),
    );

    return response.data.toString();
  }
}
