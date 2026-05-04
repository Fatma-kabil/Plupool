import 'dart:convert';

class OurProjectModel {
  final int id;
  final String nameAr;
  final String? nameEn;
  final String projectType;
  final String status;
  final String locationAr;
  final String? locationEn;
  final String startDate;
  final String expectedEndDate;
  final String? actualEndDate;
  final int? constructionDays;
  final int poolCount;
  final int progressPercentage;
  final String mainImage;
  final String clientName;
  final String clientPhone;
  final double? estimatedCost;
  final double? actualCost;
  final String currency;
  final int priority;
  final String createdAt;
  final String updatedAt;
  final String descriptionAr;
  final String? descriptionEn;
  final List<String> images;

  OurProjectModel({
    required this.id,
    required this.nameAr,
    this.nameEn,
    required this.projectType,
    required this.status,
    required this.locationAr,
    this.locationEn,
    required this.startDate,
    required this.expectedEndDate,
    this.actualEndDate,
    this.constructionDays,
    required this.poolCount,
    required this.progressPercentage,
    required this.mainImage,
    required this.clientName,
    required this.clientPhone,
    this.estimatedCost,
    this.actualCost,
    required this.currency,
    required this.priority,
    required this.createdAt,
    required this.updatedAt,
    required this.descriptionAr,
    this.descriptionEn,
    required this.images,
  });

  factory OurProjectModel.fromJson(Map<String, dynamic> json) {
    return OurProjectModel(
      id: (json['id'] as num).toInt(),

      nameAr: json['name_ar'] ?? '',
      nameEn: json['name_en'],

      projectType: json['project_type'] ?? '',
      status: json['status'] ?? '',

      locationAr: json['location_ar'] ?? '',
      locationEn: json['location_en'],

      startDate: json['start_date'] ?? '',
      expectedEndDate: json['expected_end_date'] ?? '',
      actualEndDate: json['actual_end_date'],

      constructionDays: (json['construction_days'] as num?)?.toInt(),

      poolCount: (json['pool_count'] as num?)?.toInt() ?? 0,

      progressPercentage: (json['progress_percentage'] as num?)?.toInt() ?? 0,

      mainImage: json['main_image'] ?? '',

      clientName: json['client_name'] ?? '',
      clientPhone: json['client_phone'] ?? '',

      estimatedCost: (json['estimated_cost'] as num?)?.toDouble(),

      actualCost: (json['actual_cost'] as num?)?.toDouble(),

      currency: json['currency'] ?? '',

      priority: (json['priority'] as num?)?.toInt() ?? 0,

      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',

      descriptionAr: json['description_ar'],
      descriptionEn: json['description_en'],

      images: json['images'] != null
          ? List<String>.from(jsonDecode(json['images']))
          : [],
    );
  }
}
