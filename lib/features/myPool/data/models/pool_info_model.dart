

import 'package:plupool/features/myPool/domain/entities/pool_info_entity.dart';

class PoolInfoModel extends PoolInfoEntity {
  const PoolInfoModel({
    required super.poolTypeName,
    required super.systemType,
    required super.volumeLiters,
    required super.dimensions,
    required super.lengthMeters,
    required super.widthMeters,
    required super.depthMeters,
    required super.notes,
    required super.sourceTaskId,
  });

  factory PoolInfoModel.fromJson(Map<String, dynamic> json) {
    return PoolInfoModel(
      poolTypeName: json['pool_type_name'] ?? '',
      systemType: json['system_type'] ?? '',
      volumeLiters: json['volume_liters'] ?? 0,
      dimensions: json['dimensions'] ?? '',
      lengthMeters: (json['length_meters'] ?? 0).toDouble(),
      widthMeters: (json['width_meters'] ?? 0).toDouble(),
      depthMeters: (json['depth_meters'] ?? 0).toDouble(),
      notes: json['notes'] ?? '',
      sourceTaskId: json['source_task_id'] ?? 0,
    );
  }
}