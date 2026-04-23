class RatingEntity {
  final int id;
  final String userName;
  final String userAvatar;
  final String userPhone;
  final int rating;
  final String content;
  final String status;
  final int bookingId;
  final int serviceId;
  final DateTime createdAt;

  RatingEntity({
    required this.id,
    required this.userName,
    required this.userAvatar,
    required this.userPhone,
    required this.rating,
    required this.content,
    required this.status,
    required this.bookingId,
    required this.serviceId,
    required this.createdAt,
  });
}