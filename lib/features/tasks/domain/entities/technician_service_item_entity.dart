import 'package:plupool/features/myPool/domain/entities/technician_entity.dart';
import 'package:plupool/features/tasks/domain/entities/next_visit_entity.dart';

import '../../../myPool/domain/entities/visit_entity.dart';

class ServiceItemEntity {
  final int id;
  final String bookingType;
  final String tab;
  final String title;
  final String subtitle;

  final String status;
  final String statusLabel;

  final String scheduledDate;
  final String scheduledTime;

  final String? endDate;
  final String? nextMaintenanceDate;
  final String? nextMaintenanceTime;

  final int visitsCount;
  final int completedVisits;
  final int progressPercentage;

  final String? progressText;

  final NextVisitEntity? nextVisit;

  final List<VisitEntity> visits;
  final List<TechnicianEntity> technicians;

  final bool canEdit;
  final bool canDelete;

  final String createdAt;

  const ServiceItemEntity({
    required this.id,
    required this.bookingType,
    required this.tab,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.statusLabel,
    required this.scheduledDate,
    required this.scheduledTime,
    this.endDate,
    this.nextMaintenanceDate,
    this.nextMaintenanceTime,
    required this.visitsCount,
    required this.completedVisits,
    required this.progressPercentage,
    this.progressText,
    this.nextVisit,
    required this.visits,
    required this.technicians,
    required this.canEdit,
    required this.canDelete,
    required this.createdAt,
  });
}