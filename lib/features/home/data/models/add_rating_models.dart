import 'package:plupool/features/home/domain/entities/add_rating_entity.dart';

class AddRatingModel extends AddRatingEntity {
  const AddRatingModel({
    required super.id,
    super.rating,
    required super.content,
    required super.status,
    required super.createdAt,
  });

  factory AddRatingModel.fromJson(Map<String, dynamic> json) {
    return AddRatingModel(
      id: json["id"],
      rating: json["rating"],
      content: json["content"] ?? "",
      status: json["status"] ?? "",
      createdAt: json["created_at"] ?? "",
    );
  }
}
