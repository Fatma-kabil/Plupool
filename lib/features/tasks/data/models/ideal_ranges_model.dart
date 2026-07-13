import '../../domain/entities/ideal_ranges_entity.dart';

class IdealRangesModel extends IdealRangesEntity {
  const IdealRangesModel({
    required super.temperature,
    required super.chlorine,
    required super.ph,
  });

  factory IdealRangesModel.fromJson(Map<String, dynamic> json) {
    return IdealRangesModel(
      temperature: json['temperature_c'] ?? '',
      chlorine: json['chlorine_ppm'] ?? '',
      ph: json['ph_level'] ?? '',
    );
  }
}