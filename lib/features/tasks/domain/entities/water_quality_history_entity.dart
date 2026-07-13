import 'package:equatable/equatable.dart';

class WaterQualityHistoryEntity extends Equatable {
  final double temperature;

  final double chlorine;

  final double ph;

  final double alkalinity;

  final double salinity;

  final String? notes;

  final String recordedAt;

  final String? relativeTime;

  const WaterQualityHistoryEntity({
    required this.temperature,
    required this.chlorine,
    required this.ph,
    required this.alkalinity,
    required this.salinity,
     this.notes,
    required this.recordedAt,
     this.relativeTime,
  });

  @override
  List<Object?> get props => [
        temperature,
        chlorine,
        ph,
        alkalinity,
        salinity,
        notes,
        recordedAt,
        relativeTime,
      ];
}