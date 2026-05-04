import 'dart:convert';
import '../../domain/entities/company_project_entity.dart';

class CompanyProjectModel extends CompanyProjectEntity {
  CompanyProjectModel({
    required super.id,
    required super.images,
    required super.technicianIds,
    required super.technicianNames,
    super.nameAr,
    super.nameEn,
    super.projectType,
    super.status,
    super.locationAr,
    super.locationEn,
    super.startDate,
    super.expectedEndDate,
    super.actualEndDate,
    super.constructionDays,
    super.preferredTime,
    super.poolCount,
    super.constructionStatus,
    super.progressPercentage,
    super.mainImage,
    super.clientName,
    super.clientPhone,
    super.estimatedCost,
    super.actualCost,
    super.currency,
    super.priority,
    super.createdAt,
    super.updatedAt,
    super.latitude,
    super.longitude,
    super.descriptionAr,
    super.descriptionEn,
    super.adminNotes,
    super.clientId,
    super.clientEmail,
    super.createdBy,
    super.techniciansDisplay,
    super.statusLabel,
    super.statusColor,
    super.isOverdue,
    super.daysRemaining,
    super.daysElapsed,
  });

  factory CompanyProjectModel.fromJson(Map<String, dynamic> json) {
    return CompanyProjectModel(
      id: json['id'] ?? 0,

      nameAr: json['name_ar'],
      nameEn: json['name_en'],
      projectType: json['project_type'],
      status: json['status'],
      locationAr: json['location_ar'],
      locationEn: json['location_en'],
      startDate: json['start_date'],
      expectedEndDate: json['expected_end_date'],
      actualEndDate: json['actual_end_date'],
      constructionDays: json['construction_days'],
      preferredTime: json['preferred_time'],
      poolCount: json['pool_count'],
      constructionStatus: json['construction_status'],
      progressPercentage: json['progress_percentage'],
      mainImage: json['main_image'],
      clientName: json['client_name'],
      clientPhone: json['client_phone'],
      estimatedCost: (json['estimated_cost'] as num?)?.toDouble(),
      actualCost: (json['actual_cost'] as num?)?.toDouble(),
      currency: json['currency'],
      priority: json['priority'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      descriptionAr: json['description_ar'],
      descriptionEn: json['description_en'],
      adminNotes: json['admin_notes'],
      clientId: json['client_id'],
      clientEmail: json['client_email'],
      createdBy: json['created_by'],

      images: json['images'] != null
          ? List<String>.from(jsonDecode(json['images']))
          : [],

      technicianIds: json['technician_ids'] != null
          ? List<int>.from(json['technician_ids'])
          : [],

      technicianNames: json['technician_names'] != null
          ? List<String>.from(json['technician_names'])
          : [],

      techniciansDisplay: json['technicians_display'],
      statusLabel: json['status_label'],
      statusColor: json['status_color'],
      isOverdue: json['is_overdue'],
      daysRemaining: json['days_remaining'],
      daysElapsed: json['days_elapsed'],
    );
  }
}