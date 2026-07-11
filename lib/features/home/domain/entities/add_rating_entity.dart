class AddRatingEntity {
  final int id;
  final int rating;
  final String content;
  final String status;
  final String createdAt;

  const AddRatingEntity({
    required this.id,
    required this.rating,
    required this.content,
    required this.status,
    required this.createdAt,
  });
}