class UserRatingEntity {
  final int id;
  final int? rating;
  final String content;
  final String status;
  final String serviceName;
  final DateTime createdAt;

  const UserRatingEntity({
    required this.id,
     this.rating,
    required this.content,
    required this.status,
    required this.serviceName,
    required this.createdAt,
  });
}