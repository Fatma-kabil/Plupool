import 'package:plupool/features/consruction_service/domain/entities/pool_type_entity.dart';

class PoolTypeModel extends PoolTypeEntity {
  const PoolTypeModel({
    required super.id,
    required super.nameAr,
    required super.nameEn,
    super.descriptionAr,
    super.descriptionEn,
    super.imageUrl,
    super.videoUrl,
    super.lengthMeters,
    super.widthMeters,
    super.depthMeters,
    super.features,
    super.suitableFor,
    super.basePrice,
    required super.isActive,
    required super.createdAt,
    super.updatedAt,
  });

  factory PoolTypeModel.fromJson(Map<String, dynamic> json) {
    return PoolTypeModel(
      id: json['id'],
      nameAr: json['name_ar'],
      nameEn: json['name_en'],
      descriptionAr: json['description_ar'],
      descriptionEn: json['description_en'],
      imageUrl: json['image_url'],
      videoUrl: json['video_url'],
      lengthMeters: (json['length_meters'] as num?)?.toDouble(),
      widthMeters: (json['width_meters'] as num?)?.toDouble(),
      depthMeters: (json['depth_meters'] as num?)?.toDouble(),
      features: json['features'] == null
          ? []
          : List<String>.from(json['features']),
      suitableFor: json['suitable_for'],
      basePrice: (json['base_price'] as num?)?.toDouble(),
      isActive: json['is_active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
