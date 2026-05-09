class UsersRatingModel {
  final int id;
  final int? rating;
  final String content;
  final String status;
  final String serviceName;
  final DateTime createdAt;

  UsersRatingModel({
    required this.id,
    this.rating,
    required this.content,
    required this.status,
    required this.serviceName,
    required this.createdAt,
  });

  factory UsersRatingModel.fromJson(Map<String, dynamic> json) {
    return UsersRatingModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      rating: (json['rating'] as num?)?.toInt(),
      content: json['content'] ?? '',
      status: json['status'] ?? '',
      serviceName: json['service_name'] ?? '',
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ??
          DateTime.now(),
    );
  }
}