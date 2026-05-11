class UpdateTechRatingRequest {
  final int rating;

  UpdateTechRatingRequest({
    required this.rating,
  });

  Map<String, dynamic> toJson() {
    return {
      "rating": rating,
    };
  }
}