import 'package:equatable/equatable.dart';

class PoolProfileEntity extends Equatable {
  final String nickname;
  final String poolTypeLabel;
  final int poolTypeId;

  final String systemType;

  final double volumeLiters;

  final String dimensions;

  final double lengthMeters;
  final double widthMeters;
  final double depthMeters;

  final String notes;

  final int id;
  final int taskId;

  const PoolProfileEntity({
    required this.nickname,
    required this.poolTypeLabel,
    required this.poolTypeId,
    required this.systemType,
    required this.volumeLiters,
    required this.dimensions,
    required this.lengthMeters,
    required this.widthMeters,
    required this.depthMeters,
    required this.notes,
    required this.id,
    required this.taskId,
  });

  @override
  List<Object?> get props => [
        nickname,
        poolTypeLabel,
        poolTypeId,
        systemType,
        volumeLiters,
        dimensions,
        lengthMeters,
        widthMeters,
        depthMeters,
        notes,
        id,
        taskId,
      ];
}