import 'water_quality_history_entity.dart';

class WaterQualityLatestEntity extends WaterQualityHistoryEntity {
  const WaterQualityLatestEntity({
    required super.temperature,
    required super.chlorine,
    required super.ph,
    required super.alkalinity,
    required super.salinity,
    required super.notes,
    required super.recordedAt,
    required super.relativeTime,
  });
}