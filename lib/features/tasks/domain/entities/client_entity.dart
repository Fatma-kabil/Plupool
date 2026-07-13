import 'package:equatable/equatable.dart';

class ClientEntity extends Equatable {
  final String fullName;
  final String phone;
  final String avatar;

  final String locationName;
  final String locationAddress;

  final double latitude;
  final double longitude;

  final String mapUrl;

  final String scheduledDate;
  final String scheduledTime;

  final String priority;
  final String status;

  const ClientEntity({
    required this.fullName,
    required this.phone,
    required this.avatar,
    required this.locationName,
    required this.locationAddress,
    required this.latitude,
    required this.longitude,
    required this.mapUrl,
    required this.scheduledDate,
    required this.scheduledTime,
    required this.priority,
    required this.status,
  });

  @override
  List<Object?> get props => [
        fullName,
        phone,
        avatar,
        locationName,
        locationAddress,
        latitude,
        longitude,
        mapUrl,
        scheduledDate,
        scheduledTime,
        priority,
        status,
      ];
}