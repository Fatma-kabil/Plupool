import '../../domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  const TaskModel({
    required super.id,
    required super.technicianId,
    required super.bookingId,
    required super.title,
    required super.description,
    required super.scheduledDate,
    required super.scheduledTime,
    required super.status,
    required super.priority,
    required super.locationName,
    required super.locationAddress,
    super.locationLatitude,
    super.locationLongitude,
    required super.customerName,
    super.customerAvatar,
    required super.customerPhone,
    super.notes,
    super.clientRating,
    super.clientFeedback,
    required super.createdAt,
    super.updatedAt,
    super.completedAt,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'] ?? 0,
      technicianId: json['technician_id'] ?? 0,
      bookingId: json['booking_id'] ?? 0,

      title: json['title'] ?? '',
      description: json['description'] ?? '',

      scheduledDate: json['scheduled_date'] ?? '',
      scheduledTime: json['scheduled_time'] ?? '',

      status: json['status'] ?? '',
      priority: json['priority'] ?? '',

      locationName: json['location_name'] ?? '',
      locationAddress: json['location_address'] ?? '',

      locationLatitude: json['location_latitude'] == null
          ? null
          : (json['location_latitude'] as num).toDouble(),

      locationLongitude: json['location_longitude'] == null
          ? null
          : (json['location_longitude'] as num).toDouble(),

      customerName: json['customer_name'] ?? '',
      customerAvatar: json['customer_avatar'],
      customerPhone: json['customer_phone'] ?? '',

      notes: json['notes'],

      clientRating: json['client_rating'] == null
          ? null
          : (json['client_rating'] as num).toDouble(),

      clientFeedback: json['client_feedback'],

      createdAt: DateTime.parse(json['created_at']),

      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,

      completedAt: json['completed_at'] != null
          ? DateTime.parse(json['completed_at'])
          : null,
    );
  }

  static List<TaskModel> fromList(List<dynamic> list) {
    return list
        .map((e) => TaskModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}