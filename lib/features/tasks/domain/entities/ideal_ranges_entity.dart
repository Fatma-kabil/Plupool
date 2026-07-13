import 'package:equatable/equatable.dart';

class IdealRangesEntity extends Equatable {
  final String temperature;

  final String chlorine;

  final String ph;

  const IdealRangesEntity({
    required this.temperature,
    required this.chlorine,
    required this.ph,
  });

  @override
  List<Object?> get props => [
        temperature,
        chlorine,
        ph,
      ];
}