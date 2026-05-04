class CompanyProjectEntity {
  final int id;
  final String? nameAr;
  final String? nameEn;
  final String? projectType;
  final String? status;
  final String? locationAr;
  final String? locationEn;
  final String? startDate;
  final String? expectedEndDate;
  final String? actualEndDate;
  final int? constructionDays;
  final String? preferredTime;
  final int? poolCount;
  final String? constructionStatus;
  final int? progressPercentage;
  final String? mainImage;
  final String? clientName;
  final String? clientPhone;
  final double? estimatedCost;
  final double? actualCost;
  final String? currency;
  final int? priority;
  final String? createdAt;
  final String? updatedAt;
  final double? latitude;
  final double? longitude;
  final String? descriptionAr;
  final String? descriptionEn;
  final String? adminNotes;
  final List<String> images;
  final int? clientId;
  final String? clientEmail;
  final int? createdBy;
  final List<int> technicianIds;
  final List<String> technicianNames;
  final String? techniciansDisplay;
  final String? statusLabel;
  final String? statusColor;
  final bool? isOverdue;
  final int? daysRemaining;
  final int? daysElapsed;

  CompanyProjectEntity({
    required this.id,
    required this.images,
    required this.technicianIds,
    required this.technicianNames,
    this.nameAr,
    this.nameEn,
    this.projectType,
    this.status,
    this.locationAr,
    this.locationEn,
    this.startDate,
    this.expectedEndDate,
    this.actualEndDate,
    this.constructionDays,
    this.preferredTime,
    this.poolCount,
    this.constructionStatus,
    this.progressPercentage,
    this.mainImage,
    this.clientName,
    this.clientPhone,
    this.estimatedCost,
    this.actualCost,
    this.currency,
    this.priority,
    this.createdAt,
    this.updatedAt,
    this.latitude,
    this.longitude,
    this.descriptionAr,
    this.descriptionEn,
    this.adminNotes,
    this.clientId,
    this.clientEmail,
    this.createdBy,
    this.techniciansDisplay,
    this.statusLabel,
    this.statusColor,
    this.isOverdue,
    this.daysRemaining,
    this.daysElapsed,
  });
}