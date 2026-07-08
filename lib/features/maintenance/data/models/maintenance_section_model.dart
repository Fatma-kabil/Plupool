import '../../domain/entities/maintenance_section_entity.dart';

class MaintenanceSectionModel extends MaintenanceSectionEntity {
  const MaintenanceSectionModel({
    required super.id,
    required super.titleAr,
    required super.titleEn,
    required super.imageUrl,
    required super.icon,
    required super.features,
  });

  factory MaintenanceSectionModel.fromJson(Map<String, dynamic> json) {
    return MaintenanceSectionModel(
      id: json['id'] ?? 0,
      titleAr: json['title_ar'] ?? '',
      titleEn: json['title_en'] ?? '',
      imageUrl: json['image_url'] ?? '',
      icon: json['icon'] ?? '',
      features: List<String>.from(json['features'] ?? []),
    );
  }
}