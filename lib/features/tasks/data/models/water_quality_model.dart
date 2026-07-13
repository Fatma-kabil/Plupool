import '../../domain/entities/water_quality_entity.dart';
import 'ideal_ranges_model.dart';
import 'water_quality_history_model.dart';
import 'water_quality_latest_model.dart';

class WaterQualityModel extends WaterQualityEntity {
  const WaterQualityModel({
    required super.latest,
    required super.history,
    required super.idealRanges,
  });

  factory WaterQualityModel.fromJson(Map<String, dynamic> json) {
    return WaterQualityModel(
      latest: WaterQualityLatestModel.fromJson(
        json['latest'] ?? {},
      ),
      history: (json['history'] as List<dynamic>? ?? [])
          .map(
            (e) => WaterQualityHistoryModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      idealRanges: IdealRangesModel.fromJson(
        json['ideal_ranges'] ?? {},
      ),
    );
  }
}