class PoolTypeEntity {
  final int id;
  final String nameAr;
  final String nameEn;
  final String? descriptionAr;
  final String? descriptionEn;
  final String? imageUrl;
  final String? videoUrl;
  final double? lengthMeters;
  final double? widthMeters;
  final double? depthMeters;
  final List<String>? features;
  final String? suitableFor;
  final double? basePrice;
  final bool isActive;
  final String createdAt;
  final String? updatedAt;

  const PoolTypeEntity({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    this.descriptionAr,
    this.descriptionEn,
    this.imageUrl,
    this.videoUrl,
    this.lengthMeters,
    this.widthMeters,
    this.depthMeters,
    this.features,
    this.suitableFor,
    this.basePrice,
    required this.isActive,
    required this.createdAt,
    this.updatedAt,
  });
}