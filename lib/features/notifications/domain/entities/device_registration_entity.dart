import 'package:equatable/equatable.dart';

class DeviceRegistrationEntity extends Equatable {
  final int id;
  final String platform;
  final String deviceId;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  const DeviceRegistrationEntity({
    required this.id,
    required this.platform,
    required this.deviceId,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        platform,
        deviceId,
        isActive,
        createdAt,
        updatedAt,
      ];
}