import 'package:dio/dio.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/home/data/models/add_rating_models.dart';
import 'package:plupool/features/home/data/models/rating_request_model.dart';
import 'package:plupool/features/home/domain/params/add_rating_params.dart';

class AddRatingRemoteDataSource {
  final ApiService apiService;

  AddRatingRemoteDataSource(this.apiService);

  Future<AddRatingModel> addRating(RatingParams params) async {
    final body = RatingRequestModel.fromEntity(params).toJson();

    final response = await apiService.post(
      "${Endpoints.baseUrl}/pool-owner/ratings",
      data: body,
       options: Options(
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxIiwicm9sZSI6InBvb2xfb3duZXIiLCJleHAiOjE3ODU1OTgzNTh9.mlzkmAfen0LawV5hQKEL7fxAeHJV7juTOf-G2LGHsDo',
        },
      ),
    );

    return AddRatingModel.fromJson(response.data);
  }
}
