import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/home/data/models/add_rating_models.dart';
import 'package:plupool/features/home/data/models/rating_request_model.dart';
import 'package:plupool/features/home/domain/params/add_rating_params.dart';

class AddRatingRemoteDataSource {
  final ApiService apiService;

  AddRatingRemoteDataSource(this.apiService);

  Future<AddRatingModel> addRating(RatingParams params) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    final body = RatingRequestModel.fromEntity(params).toJson();

    final response = await apiService.post(
      "${Endpoints.baseUrl}/pool-owner/ratings",
      data: body,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );

    return AddRatingModel.fromJson(response.data);
  }
}