class UsersRatingModel {
  final int id;
  final int rating;
  final String content;
  final String status;
  final String serviceName;
  final DateTime createdAt;

  UsersRatingModel({
    required this.id,
    required this.rating,
    required this.content,
    required this.status,
    required this.serviceName,
    required this.createdAt,
  });

  factory UsersRatingModel.fromJson(Map<String, dynamic> json) {
    return UsersRatingModel(
      id: json['id'],
      rating: json['rating'],
      content: json['content'],
      status: json['status'],
      serviceName: json['service_name'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}