class UpdateTechRatingRequest {
  final int rating;

  UpdateTechRatingRequest({
    required this.rating,
  });

  Map<String, dynamic> toJson() {
    return {
      "average_rating": rating,

    };
  }
}