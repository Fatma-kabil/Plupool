import '../../domain/entities/visit_entity.dart';
import 'technician_model.dart';

class VisitModel extends VisitEntity {
  const VisitModel({
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
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      scheduledDate: json['scheduled_date'] ?? '',
      scheduledTime: json['scheduled_time'] ?? '',
      status: json['status'] ?? '',
      statusLabel: json['status_label'] ?? '',
      technician: TechnicianModel.fromJson(
        json['technician'] ?? {},
      ),
      notes: json['notes'],
    );
  }

  VisitEntity toEntity() => this;
}