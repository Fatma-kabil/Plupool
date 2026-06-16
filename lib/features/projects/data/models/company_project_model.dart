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
    required super.completedPoolsCounts,
    super.remainingPoolsCounts,
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
      completedPoolsCounts: json['completed_pools_count'],
      remainingPoolsCounts: json['remaining_pools_count'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (nameAr != null) data['name_ar'] = nameAr;
    if (nameEn != null) data['name_en'] = nameEn;
    if (projectType != null) data['project_type'] = projectType;
    if (status != null) data['status'] = status;
    if (locationAr != null) data['location_ar'] = locationAr;
    if (locationEn != null) data['location_en'] = locationEn;
    if (startDate != null) data['start_date'] = startDate;
    if (expectedEndDate != null) {
      data['expected_end_date'] = expectedEndDate;
    }
    if (actualEndDate != null) data['actual_end_date'] = actualEndDate;
    if (constructionDays != null) {
      data['construction_days'] = constructionDays;
    }
    if (preferredTime != null) data['preferred_time'] = preferredTime;
    if (poolCount != null) data['pool_count'] = poolCount;
    if (constructionStatus != null) {
      data['construction_status'] = constructionStatus;
    }
    if (progressPercentage != null) {
      data['progress_percentage'] = progressPercentage;
    }
    if (latitude != null) data['latitude'] = latitude;
    if (longitude != null) data['longitude'] = longitude;
    if (descriptionAr != null) data['description_ar'] = descriptionAr;
    if (descriptionEn != null) data['description_en'] = descriptionEn;
    if (adminNotes != null) data['admin_notes'] = adminNotes;
    if (clientId != null) data['client_id'] = clientId;
    if (clientName != null) data['client_name'] = clientName;
    if (clientPhone != null) data['client_phone'] = clientPhone;
    if (clientEmail != null) data['client_email'] = clientEmail;
    if (estimatedCost != null) data['estimated_cost'] = estimatedCost;
    if (actualCost != null) data['actual_cost'] = actualCost;
    if (currency != null) data['currency'] = currency;
    if (priority != null) data['priority'] = priority;
    if (technicianIds.isNotEmpty) {
      data['technician_ids'] = technicianIds;
    }

    return data;
  }
}
