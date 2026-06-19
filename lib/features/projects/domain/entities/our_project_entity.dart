class OurProjectEntity {
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

  final List<String>? images;

  final int? clientId;
  final String? clientEmail;

  final int? isCompanyProject;

  final String? constructionDaysAr;

  final int? createdBy;

  final String? durationWeeks;
  final String? deliveryDays;
  final String? companyPartner;

  final String? image1;
  final String? image2;

  final int? isHomeFeatured;
  final int? isActive;

  final List<int>? technicianIds;
  final List<String>? technicianNames;

  final String? techniciansDisplay;

  final String? statusLabel;
  final String? statusColor;

  final bool? isOverdue;
  final int? daysRemaining;
  final int? daysElapsed;

  const OurProjectEntity({
    required this.id,
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
     this.images,
    this.clientId,
    this.clientEmail,
    this.isCompanyProject,
    this.constructionDaysAr,
    this.createdBy,
    this.durationWeeks,
    this.deliveryDays,
    this.companyPartner,
    this.image1,
    this.image2,
    this.isHomeFeatured,
    this.isActive,
     this.technicianIds,
     this.technicianNames,
    this.techniciansDisplay,
    this.statusLabel,
    this.statusColor,
    this.isOverdue,
    this.daysRemaining,
    this.daysElapsed,
  });
}