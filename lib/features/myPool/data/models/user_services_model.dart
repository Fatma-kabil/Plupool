import 'package:plupool/features/myPool/domain/entities/user_service_entity.dart';

class UserServiceModel extends UserServiceEntity {
  UserServiceModel({
    required super.id,
    required super.bookingType,
    required super.tab,
    required super.title,
    required super.subtitle,
    required super.status,
    required super.statusLabel,
    required super.scheduledDate,
    required super.scheduledTime,
    super.nextMaintenanceDate,
    super.nextMaintenanceTime,
    super.endDate,
    required super.visitsCount,
    required super.completedVisits,
    required super.progressPercentage,
    required super.visits,
    required super.technicians,
    required super.canEdit,
    required super.canDelete,
    required super.createdAt,
  });

  factory UserServiceModel.fromJson(Map<String, dynamic> json) {
    return UserServiceModel(
      id: json['id'],
      bookingType: json['booking_type'],
      tab: json['tab'],
      title: json['title'],
      subtitle: json['subtitle'],
      status: json['status'],
      statusLabel: json['status_label'],
      scheduledDate: json['scheduled_date'],
      scheduledTime: json['scheduled_time'],
      nextMaintenanceDate: json['next_maintenance_date'],
      visitsCount: json['visits_count'],
      completedVisits: json['completed_visits'],
      progressPercentage: json['progress_percentage'],
      visits: (json['visits'] as List)
          .map((e) => VisitModel.fromJson(e))
          .toList(),
      technicians: (json['technicians'] as List)
          .map((e) => TechnicianModel.fromJson(e))
          .toList(),
      canEdit: json['can_edit'],
      canDelete: json['can_delete'],
      createdAt: json['created_at'],
      nextMaintenanceTime: json['next_maintenance_time'],
      endDate: json['end_date'],
    );
  }
}

class TechnicianModel extends TechnicianEntity {
  TechnicianModel({
    required super.id,
    required super.name,
    required super.phone,
    super.profileImage,
  });

  factory TechnicianModel.fromJson(Map<String, dynamic> json) {
    return TechnicianModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      profileImage: json['profile_image'],
    );
  }
}

class VisitModel extends VisitEntity {
  VisitModel({
    required super.id,
    required super.title,
    required super.scheduledDate,
    required super.scheduledTime,
    required super.status,
    required super.statusLabel,
    required super.technician,
    super.notes,
  });

  factory VisitModel.fromJson(Map<String, dynamic> json) {
    return VisitModel(
      id: json['id'],
      title: json['title'],
      scheduledDate: json['scheduled_date'],
      scheduledTime: json['scheduled_time'],
      status: json['status'],
      statusLabel: json['status_label'],
      technician: TechnicianModel.fromJson(json['technician']),
      notes: json['notes'],
    );
  }
}
