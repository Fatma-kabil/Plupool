import '../../domain/entities/pool_profile_entity.dart';

class PoolProfileModel extends PoolProfileEntity {
  const PoolProfileModel({
    required super.nickname,
    required super.poolTypeLabel,
    required super.poolTypeId,
    required super.systemType,
    required super.volumeLiters,
    required super.dimensions,
    required super.lengthMeters,
    required super.widthMeters,
    required super.depthMeters,
    required super.notes,
    required super.id,
    required super.taskId,
  });

  factory PoolProfileModel.fromJson(Map<String, dynamic> json) {
    return PoolProfileModel(
      nickname: json['nickname'] ?? '',
      poolTypeLabel: json['pool_type_label'] ?? '',
      poolTypeId: json['pool_type_id'] ?? 0,
      systemType: json['system_type'] ?? '',
      volumeLiters: (json['volume_liters'] ?? 0).toDouble(),
      dimensions: json['dimensions'] ?? '',
      lengthMeters: (json['length_meters'] ?? 0).toDouble(),
      widthMeters: (json['width_meters'] ?? 0).toDouble(),
      depthMeters: (json['depth_meters'] ?? 0).toDouble(),
      notes: json['notes'] ?? '',
      id: json['id'] ?? 0,
      taskId: json['task_id'] ?? 0,
    );
  }
}