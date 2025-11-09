class WaterQualityModel {
  final double chlorineLevel;
  final double phLevel;
  final double temperature;
  final DateTime lastUpdated;
  final String? note;

  WaterQualityModel({
    required this.chlorineLevel,
    required this.phLevel,
    required this.temperature,
    required this.lastUpdated,
    this.note,
  });
}
