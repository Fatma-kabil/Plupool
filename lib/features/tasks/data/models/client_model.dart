import '../../domain/entities/client_entity.dart';

class ClientModel extends ClientEntity {
  const ClientModel({
    required super.fullName,
    required super.phone,
    required super.avatar,
    required super.locationName,
    required super.locationAddress,
    required super.latitude,
    required super.longitude,
    required super.mapUrl,
    required super.scheduledDate,
    required super.scheduledTime,
    required super.priority,
    required super.status,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      fullName: json['full_name'] ?? '',
      phone: json['phone'] ?? '',
      avatar: json['avatar'] ?? '',
      locationName: json['location_name'] ?? '',
      locationAddress: json['location_address'] ?? '',
      latitude: (json['latitude'] ?? 0).toDouble(),
      longitude: (json['longitude'] ?? 0).toDouble(),
      mapUrl: json['map_url'] ?? '',
      scheduledDate: json['scheduled_date'] ?? '',
      scheduledTime: json['scheduled_time'] ?? '',
      priority: json['priority'] ?? '',
      status: json['status'] ?? '',
    );
  }
}