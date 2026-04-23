import '../../domain/entities/rating_entity.dart';

class RatingModel extends RatingEntity {
  RatingModel({
    required super.id,
    required super.userName,
    required super.userAvatar,
    required super.userPhone,
    required super.rating,
    required super.content,
    required super.status,
    required super.bookingId,
    required super.serviceId,
    required super.createdAt,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      id: json['id'],
      userName: json['user_name'],
      userAvatar: json['user_avatar'],
      userPhone: json['user_phone'],
      rating: json['rating'],
      content: json['content'],
      status: json['status'],
      bookingId: json['booking_id'],
      serviceId: json['service_id'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}