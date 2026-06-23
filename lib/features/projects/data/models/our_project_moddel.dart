import 'dart:convert';
import '../../domain/entities/our_project_entity.dart';

class OurProjectModel extends OurProjectEntity {
  const OurProjectModel({
    required super.id,
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
    super.images,
    super.clientId,
    super.clientEmail,
    super.isCompanyProject,
    super.constructionDaysAr,
    super.createdBy,
    super.durationWeeks,
    super.deliveryDays,
    super.companyPartner,
    super.image1,
    super.image2,
    super.isHomeFeatured,
    super.isActive,
    super.technicianIds,
    super.technicianNames,
    super.techniciansDisplay,
    super.statusLabel,
    super.statusColor,
    super.isOverdue,
    super.daysRemaining,
    super.daysElapsed,
  });

  factory OurProjectModel.fromJson(Map<String, dynamic> json) {
    return OurProjectModel(
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

      constructionDays: (json['construction_days'] as num?)?.toInt(),
      preferredTime: json['preferred_time'],

      poolCount: (json['pool_count'] as num?)?.toInt(),
      constructionStatus: json['construction_status'],

      progressPercentage: (json['progress_percentage'] as num?)?.toInt(),

      mainImage: json['main_image'],

      clientName: json['client_name'],
      clientPhone: json['client_phone'],

      estimatedCost: (json['estimated_cost'] as num?)?.toDouble(),
      actualCost: (json['actual_cost'] as num?)?.toDouble(),

      currency: json['currency'],
      priority: (json['priority'] as num?)?.toInt(),

      createdAt: json['created_at'],
      updatedAt: json['updated_at'],

      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),

      descriptionAr: json['description_ar'],
      descriptionEn: json['description_en'],
      adminNotes: json['admin_notes'],

      images: json['images'] != null
          ? List<String>.from(jsonDecode(json['images']))
          : [],

      clientId: json['client_id'],
      clientEmail: json['client_email'],

      isCompanyProject: (json['is_company_project'] as num?)?.toInt(),

      constructionDaysAr: json['construction_days_ar'],

      createdBy: json['created_by'],

     durationWeeks: (json['duration_weeks'] as num?)?.toInt(),
      deliveryDays: json['delivery_days'],
      companyPartner: json['company_partner'],

      image1: json['image_1'],
      image2: json['image_2'],

      isHomeFeatured: (json['is_home_featured'] as num?)?.toInt(),
      isActive: (json['is_active'] as num?)?.toInt(),

      technicianIds: json['technician_ids'] is List
          ? List<int>.from(json['technician_ids'].map((e) => e as int))
          : [],

      technicianNames: json['technician_names'] != null
          ? List<String>.from(json['technician_names'])
          : [],

      techniciansDisplay: json['technicians_display'],

      statusLabel: json['status_label'],
      statusColor: json['status_color'],

      isOverdue:
          json['is_overdue'] == true ||
          json['is_overdue'] == 1 ||
          json['is_overdue'] == "true",

      daysRemaining: json['days_remaining'],
      daysElapsed: json['days_elapsed'],
    );
  }
}
