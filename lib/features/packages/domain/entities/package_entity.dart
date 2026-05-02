class PackageEntity {
  final int id;
  final String nameAr;
  final String? nameEn;
  final String? descriptionAr;
  final String? descriptionEn;
  final String? clientName;
  final String duration;
  final int price;
  final int visitsCount;
  final int completedVisits;
  final String? status;
  final String? displayDate;
  final double progress;
  final String createdAt;

  PackageEntity({
    required this.id,
    required this.nameAr,
    this.nameEn,
    this.descriptionAr,
    this.descriptionEn,
    this.clientName,
    required this.duration,
    required this.price,
    required this.visitsCount,
    required this.completedVisits,
    this.status,
    this.displayDate,
    required this.progress,
    required this.createdAt,
  });
}