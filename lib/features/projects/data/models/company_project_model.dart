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

  /// 🔥 helpers عشان نمنع كل errors
  static int _toInt(dynamic v) =>
      v is int ? v : int.tryParse(v?.toString() ?? '') ?? 0;

  static double _toDouble(dynamic v) =>
      v is double ? v : double.tryParse(v?.toString() ?? '') ?? 0.0;

  static String _toString(dynamic v) => v?.toString() ?? '';

  factory CompanyProjectModel.fromJson(Map<String, dynamic> json) {
    return CompanyProjectModel(
      id: _toInt(json['id']),

      nameAr: _toString(json['name_ar']),
      nameEn: _toString(json['name_en']),
      projectType: _toString(json['project_type']),
      status: _toString(json['status']),

      locationAr: _toString(json['location_ar']),
      locationEn: _toString(json['location_en']),

      startDate: json['start_date']?.toString(),
      expectedEndDate: json['expected_end_date']?.toString(),
      actualEndDate: json['actual_end_date']?.toString(),

      constructionDays: _toInt(json['construction_days']),
      preferredTime: _toString(json['preferred_time']),

      poolCount: _toInt(json['pool_count']),
      constructionStatus: _toString(json['construction_status']),

      progressPercentage: _toDouble(json['progress_percentage']),

      mainImage: _toString(json['main_image']),

      clientName: _toString(json['client_name']),
      clientPhone: _toString(json['client_phone']),

      estimatedCost: _toDouble(json['estimated_cost']),
      actualCost: _toDouble(json['actual_cost']),

      currency: _toString(json['currency']),
      priority: _toInt(json['priority']),

      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),

      latitude: _toDouble(json['latitude']),
      longitude: _toDouble(json['longitude']),

      descriptionAr: _toString(json['description_ar']),
      descriptionEn: _toString(json['description_en']),
      adminNotes: _toString(json['admin_notes']),

      clientId: _toInt(json['client_id']),
      clientEmail: _toString(json['client_email']),
      createdBy: _toInt(json['created_by']),

      images: json['images'] != null
          ? List<String>.from(jsonDecode(json['images']))
          : [],

      technicianIds: json['technician_ids'] != null
          ? List<int>.from((json['technician_ids'] as List)
              .map((e) => _toInt(e)))
          : [],

      technicianNames: json['technician_names'] != null
          ? List<String>.from(json['technician_names'])
          : [],

      techniciansDisplay: _toString(json['technicians_display']),
      statusLabel: _toString(json['status_label']),
      statusColor: _toString(json['status_color']),

      isOverdue: json['is_overdue'] == true,
      daysRemaining: _toInt(json['days_remaining']),
      daysElapsed: _toInt(json['days_elapsed']),

      completedPoolsCounts: _toInt(json['completed_pools_count']),
      remainingPoolsCounts: _toInt(json['remaining_pools_count']),
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
    if (expectedEndDate != null) data['expected_end_date'] = expectedEndDate;
    if (actualEndDate != null) data['actual_end_date'] = actualEndDate;
    if (constructionDays != null) data['construction_days'] = constructionDays;
    if (preferredTime != null) data['preferred_time'] = preferredTime;
    if (poolCount != null) data['pool_count'] = poolCount;
    if (constructionStatus != null) data['construction_status'] = constructionStatus;
    if (progressPercentage != null) data['progress_percentage'] = progressPercentage;
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