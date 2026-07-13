import '../../domain/entities/water_quality_latest_entity.dart';

class WaterQualityLatestModel extends WaterQualityLatestEntity {
  const WaterQualityLatestModel({
    required super.temperature,
    required super.chlorine,
    required super.ph,
    required super.alkalinity,
    required super.salinity,
    required super.notes,
    required super.recordedAt,
    required super.relativeTime,
  });

  factory WaterQualityLatestModel.fromJson(Map<String, dynamic> json) {
    return WaterQualityLatestModel(
      temperature: (json['temperature_c'] ?? 0).toDouble(),
      chlorine: (json['chlorine_ppm'] ?? 0).toDouble(),
      ph: (json['ph_level'] ?? 0).toDouble(),
      alkalinity: (json['alkalinity_ppm'] ?? 0).toDouble(),
      salinity: (json['salinity_ppm'] ?? 0).toDouble(),
      notes: json['notes'] ?? '',
      recordedAt: json['recorded_at'] ?? '',
      relativeTime: json['relative_time'] ?? '',
    );
  }
}