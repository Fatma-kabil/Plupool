import '../../domain/entities/device_registration_entity.dart';

class DeviceRegistrationModel extends DeviceRegistrationEntity {
  const DeviceRegistrationModel({
    required super.id,
    required super.platform,
    required super.deviceId,
    required super.isActive,
    required super.createdAt,
    required super.updatedAt,
  });

  factory DeviceRegistrationModel.fromJson(Map<String, dynamic> json) {
    return DeviceRegistrationModel(
      id: json['id'],
      platform: json['platform'],
      deviceId: json['device_id'],
      isActive: json['is_active'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}