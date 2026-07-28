import '../../domain/entities/pool_details_entity.dart';

class PoolDetailsModel extends PoolDetailsEntity {
  const PoolDetailsModel({
    required super.profileId,
    required super.sourceTaskId,
    required super.nickname,
    required super.poolTypeId,
    required super.poolTypeName,
    required super.systemType,
    required super.volumeLiters,
    required super.dimensions,
    required super.lengthMeters,
    required super.widthMeters,
    required super.depthMeters,
    required super.notes,
    required super.updatedAt,
  });

  factory PoolDetailsModel.fromJson(Map<String, dynamic> json) {
    return PoolDetailsModel(
      profileId: json['profile_id'] ?? 0,
      sourceTaskId: json['source_task_id'] ?? 0,
      nickname: json['nickname'] ?? '',
      poolTypeId: json['pool_type_id'] ?? 0,
      poolTypeName: json['pool_type_name'] ?? '',
      systemType: json['system_type'],
      volumeLiters: (json['volume_liters'] ?? 0).toDouble(),
      dimensions: json['dimensions'],
      lengthMeters: json['length_meters']?.toDouble(),
      widthMeters: json['width_meters']?.toDouble(),
      depthMeters: json['depth_meters']?.toDouble(),
      notes: json['notes'],
      updatedAt: json['updated_at'],
    );
  }

  PoolDetailsEntity toEntity() => this;
}
