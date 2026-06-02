class ProjectCardModel {
  final String title;
  final String description;
  final String imageUrlBefore;
  final String imageUrlAfter;
  final String? companyName;
  final String? companyImage;
  final String location;
  final String duration;
  final bool isFeatured;

  ProjectCardModel({
    required this.title,
    required this.description,
    required this.imageUrlBefore,
    required this.imageUrlAfter,
    this.companyName,
    this.companyImage,
    required this.location,
    required this.duration,
    this.isFeatured = false,
  });
}
