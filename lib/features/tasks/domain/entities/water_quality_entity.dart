import 'ideal_ranges_entity.dart';
import 'water_quality_history_entity.dart';
import 'water_quality_latest_entity.dart';

class WaterQualityEntity {
  final WaterQualityLatestEntity latest;

  final List<WaterQualityHistoryEntity> history;

  final IdealRangesEntity idealRanges;

  const WaterQualityEntity({
    required this.latest,
    required this.history,
    required this.idealRanges,
  });
}