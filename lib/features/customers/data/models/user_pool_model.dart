import 'package:plupool/features/customers/domain/entities/user_pool_entity.dart';

class UserPoolModel extends UserPoolEntity {
  UserPoolModel({
    super.poolTypeName,
    super.systemType,
    super.volumeLiters,
    super.dimensions,
    super.lengthMeters,
    super.widthMeters,
    super.depthMeters,
    super.notes,
    super.sourceTaskId,
  });

  factory UserPoolModel.fromJson(Map<String, dynamic> json) {
  return UserPoolModel(
    poolTypeName: json['pool_type_name'],
    systemType: json['system_type'],

    volumeLiters: (json['volume_liters'] as num?)?.toDouble(),
    lengthMeters: (json['length_meters'] as num?)?.toDouble(),
    widthMeters: (json['width_meters'] as num?)?.toDouble(),
    depthMeters: (json['depth_meters'] as num?)?.toDouble(),

    dimensions: json['dimensions'],
    notes: json['notes'],
    sourceTaskId: json['source_task_id'],
  );
}

  Map<String, dynamic> toJson() {
    return {
      "pool_type_name": poolTypeName,
      "system_type": systemType,
      "volume_liters": volumeLiters,
      "dimensions": dimensions,
      "length_meters": lengthMeters,
      "width_meters": widthMeters,
      "depth_meters": depthMeters,
      "notes": notes,
    };
  }
}