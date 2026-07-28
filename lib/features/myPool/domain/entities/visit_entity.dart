import 'package:plupool/features/myPool/domain/entities/technician_entity.dart';

class VisitEntity {
  final int id;

  final String title;

  final String scheduledDate;

  final String scheduledTime;

  final String status;

  final String statusLabel;

  final TechnicianEntity technician;

  final String? notes;

  const VisitEntity({
    required this.id,
    required this.title,
    required this.scheduledDate,
    required this.scheduledTime,
    required this.status,
    required this.statusLabel,
    required this.technician,
    this.notes,
  });
}