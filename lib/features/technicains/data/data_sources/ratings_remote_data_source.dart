import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/technicains/data/models/update_tech_rating_request.dart';
import 'package:dio/dio.dart';
class RatingsTechRemoteDataSource {
  final ApiService apiService;

  RatingsTechRemoteDataSource({required this.apiService});

  Future<String> updateTechRating({
    required int userId,
 
    required UpdateTechRatingRequest request,
  }) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');
    final response = await apiService.patch(
      '${Endpoints.users}/$userId/average-rating',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
      data: request.toJson(),
    );

    return response.data.toString();
  }
}
