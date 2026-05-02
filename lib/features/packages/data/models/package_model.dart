import '../../domain/entities/package_entity.dart';

class PackageModel extends PackageEntity {
  PackageModel({
    required super.id,
    required super.nameAr,
    super.nameEn,
    super.descriptionAr,
    super.descriptionEn,
    super.clientName,
    required super.duration,
    required super.price,
    required super.visitsCount,
    required super.completedVisits,
    super.status,
    super.displayDate,
    required super.progress,
    required super.createdAt,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) {
    return PackageModel(
      id: json['id'],
      nameAr: json['name_ar'],
      nameEn: json['name_en'],
      descriptionAr: json['description_ar'],
      descriptionEn: json['description_en'],
      clientName: json['client_name'],
      duration: json['duration'],
      price: json['price'],
      visitsCount: json['visits_count'],
      completedVisits: json['completed_visits'],
      status: json['status'],
      displayDate: json['display_date'],
      progress: (json['progress_percentage'] ?? 0).toDouble(),
      createdAt: json['created_at'],
    );
  }
}