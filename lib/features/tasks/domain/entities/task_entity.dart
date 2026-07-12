import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final int id;
  final int technicianId;
  final int bookingId;

  final String title;
  final String description;

  final String scheduledDate;
  final String scheduledTime;

  final String status;
  final String priority;

  final String locationName;
  final String locationAddress;
  final double? locationLatitude;
  final double? locationLongitude;

  final String customerName;
  final String? customerAvatar;
  final String customerPhone;

  final String? notes;
  final double? clientRating;
  final String? clientFeedback;

  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? completedAt;

  const TaskEntity({
    required this.id,
    required this.technicianId,
    required this.bookingId,
    required this.title,
    required this.description,
    required this.scheduledDate,
    required this.scheduledTime,
    required this.status,
    required this.priority,
    required this.locationName,
    required this.locationAddress,
    this.locationLatitude,
    this.locationLongitude,
    required this.customerName,
    this.customerAvatar,
    required this.customerPhone,
    this.notes,
    this.clientRating,
    this.clientFeedback,
    required this.createdAt,
    this.updatedAt,
    this.completedAt,
  });

  @override
  List<Object?> get props => [
        id,
        technicianId,
        bookingId,
        title,
        description,
        scheduledDate,
        scheduledTime,
        status,
        priority,
        locationName,
        locationAddress,
        locationLatitude,
        locationLongitude,
        customerName,
        customerAvatar,
        customerPhone,
        notes,
        clientRating,
        clientFeedback,
        createdAt,
        updatedAt,
        completedAt,
      ];
}