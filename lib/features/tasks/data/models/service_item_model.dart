
import 'package:plupool/features/myPool/data/models/technician_model.dart';
import 'package:plupool/features/tasks/domain/entities/technician_service_item_entity.dart';

import '../../../myPool/data/models/visit_model.dart';
import 'next_visit_model.dart';

class ServiceItemModel extends ServiceItemEntity {
  const ServiceItemModel({
    required super.id,
    required super.bookingType,
    required super.tab,
    required super.title,
    required super.subtitle,
    required super.status,
    required super.statusLabel,
    required super.scheduledDate,
    required super.scheduledTime,
    super.endDate,
    super.nextMaintenanceDate,
    super.nextMaintenanceTime,
    required super.visitsCount,
    required super.completedVisits,
    required super.progressPercentage,
    super.progressText,
    super.nextVisit,
    required super.visits,
    required super.technicians,
    required super.canEdit,
    required super.canDelete,
    required super.createdAt,
  });

  factory ServiceItemModel.fromJson(Map<String, dynamic> json) {
    return ServiceItemModel(
      id: json['id'],
      bookingType: json['booking_type'],
      tab: json['tab'],
      title: json['title'],
      subtitle: json['subtitle'],
      status: json['status'],
      statusLabel: json['status_label'],
      scheduledDate: json['scheduled_date'],
      scheduledTime: json['scheduled_time'],
      endDate: json['end_date'],
      nextMaintenanceDate: json['next_maintenance_date'],
      nextMaintenanceTime: json['next_maintenance_time'],
      visitsCount: json['visits_count'],
      completedVisits: json['completed_visits'],
      progressPercentage: json['progress_percentage'],
      progressText: json['progress_text'],
      nextVisit: json['next_visit'] != null
          ? NextVisitModel.fromJson(json['next_visit'])
          : null,
      visits: (json['visits'] as List)
          .map((e) => VisitModel.fromJson(e))
          .toList(),
      technicians: (json['technicians'] as List)
          .map((e) => TechnicianModel.fromJson(e))
          .toList(),
      canEdit: json['can_edit'],
      canDelete: json['can_delete'],
      createdAt: json['created_at'],
    );
  }
}