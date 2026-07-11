import 'package:plupool/features/home/domain/params/add_rating_params.dart';


class RatingRequestModel {
  final int rating;
  final String content;

  const RatingRequestModel({
    required this.rating,
    required this.content,
  });

  factory RatingRequestModel.fromEntity(
    RatingParams entity,
  ) {
    return RatingRequestModel(
      rating: entity.rating,
      content: entity.content,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "rating": rating,
      "content": content,
    };
  }
}