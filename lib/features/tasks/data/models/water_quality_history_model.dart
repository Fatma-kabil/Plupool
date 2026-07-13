import '../../domain/entities/water_quality_history_entity.dart';

class WaterQualityHistoryModel extends WaterQualityHistoryEntity {
  const WaterQualityHistoryModel({
    required super.temperature,
    required super.chlorine,
    required super.ph,
    required super.alkalinity,
    required super.salinity,
    super.notes,
    required super.recordedAt,
    super.relativeTime,
  });

  factory WaterQualityHistoryModel.fromJson(Map<String, dynamic> json) {
    return WaterQualityHistoryModel(
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
  Map<String, dynamic> toJson() {
    return {
      "temperature_c": temperature,
      "chlorine_ppm": chlorine,
      "ph_level": ph,
      "alkalinity_ppm": alkalinity,
      "salinity_ppm": salinity,
      "notes": notes,
      "recorded_at": recordedAt,
    };
  }

  factory WaterQualityHistoryModel.fromEntity(
    WaterQualityHistoryEntity entity,
  ) {
    return WaterQualityHistoryModel(
      temperature: entity.temperature,
      chlorine: entity.chlorine,
      ph: entity.ph,
      alkalinity: entity.alkalinity,
      salinity: entity.salinity,
      notes: entity.notes,
      recordedAt: entity.recordedAt,
      relativeTime: entity.relativeTime,
    );
  }
}
