import 'dart:io';

class OfferEntity {
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final num discountValue;
  final String imageUrl;
  final File? image;
  final int? id;
  final bool isFeatured;

  OfferEntity({
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.discountValue,
    required this.imageUrl,
    this.image,
    this.id,
    required this.isFeatured,
  });
}
