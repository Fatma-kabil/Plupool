class ReviewCardModel {
  final String name;
  final String avatarUrl;
  final int rating; // من 1 لـ 5
  final String timeAgo;
  final String comment;

  ReviewCardModel({required this.name, required this.avatarUrl, required this.rating, required this.timeAgo, required this.comment});

  
}