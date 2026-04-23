
import 'package:plupool/features/rating/domain/entities/rating_entities.dart';

import 'rating_model.dart';

class RatingsResponseModel extends RatingsEntity {
  RatingsResponseModel({
    required super.ratings,
    required super.total,
    required super.page,
    required super.limit,
    required super.totalPages,
  });

  factory RatingsResponseModel.fromJson(Map<String, dynamic> json) {
    return RatingsResponseModel(
      ratings: List.from(json['ratings'])
          .map((e) => RatingModel.fromJson(e))
          .toList(),
      total: json['total'],
      page: json['page'],
      limit: json['limit'],
      totalPages: json['total_pages'],
    );
  }
}