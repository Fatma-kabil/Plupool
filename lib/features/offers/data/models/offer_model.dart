import 'dart:io';
import 'package:dio/dio.dart';
import 'package:plupool/features/offers/domain/enities/offer_entity.dart';

class OfferModel {
  final String? titleAr;
  final String? titleEn;
  final String? descriptionAr;
  final String? descriptionEn;
  final int? serviceId;
  final double? originalPrice;
  final String? discountType;
  final double? discountValue;
  final int? sessionsCount;
  final int? bonusSessions;
  final String? imageUrl;
  final String? badgeText;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? status;
  final bool isFeatured;
  final int? sortOrder;
  final int? id;
  final double? finalPrice;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  final File? imageFile;

  OfferModel({
    this.titleAr,
    this.titleEn,
    this.descriptionAr,
    this.descriptionEn,
    this.serviceId,
    this.originalPrice,
    this.discountType,
    this.discountValue,
    this.sessionsCount,
    this.bonusSessions,
    this.imageUrl,
    this.badgeText,
    this.startDate,
    this.endDate,
    this.status,
    this.isFeatured = false,
    this.sortOrder,
    this.id,
    this.finalPrice,
    this.createdAt,
    this.updatedAt,
    this.imageFile,
  });

  // =========================
  // From Entity
  // =========================
  factory OfferModel.fromEntity(OfferEntity entity) {
    return OfferModel(
      titleAr: entity.title,
      descriptionAr: entity.description,
      startDate: entity.startDate,
      endDate: entity.endDate,
      discountValue: entity.discountValue.toDouble(),
      imageUrl: entity.imageUrl,
      id: entity.id,
      isFeatured: entity.isFeatured,
    );
  }

  // =========================
  // To Entity
  // =========================
  OfferEntity toEntity() {
    return OfferEntity(
      title: titleAr ?? "",
      description: descriptionAr ?? "",
      startDate: startDate ?? DateTime.now(),
      endDate: endDate ?? DateTime.now(),
      discountValue: discountValue ?? 0,
      imageUrl: imageUrl ?? "",
      id: id,
      isFeatured: isFeatured,
    );
  }

  // =========================
  // From JSON
  // =========================
  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      titleAr: json["title_ar"],
      titleEn: json["title_en"],
      descriptionAr: json["description_ar"],
      descriptionEn: json["description_en"],
      serviceId: json["service_id"],
      originalPrice: (json["original_price"] as num?)?.toDouble(),
      discountType: json["discount_type"],
      discountValue: (json["discount_value"] as num?)?.toDouble(),
      sessionsCount: json["sessions_count"],
      bonusSessions: json["bonus_sessions"],
      imageUrl: json["image_url"],
      badgeText: json["badge_text"],
      startDate: json["start_date"] != null
          ? DateTime.parse(json["start_date"])
          : null,
      endDate: json["end_date"] != null
          ? DateTime.parse(json["end_date"])
          : null,
      status: json["status"],
      isFeatured: json["is_featured"] ?? false,
      sortOrder: json["sort_order"],
      id: json["id"],
      finalPrice: (json["final_price"] as num?)?.toDouble(),
      createdAt: json["created_at"] != null
          ? DateTime.parse(json["created_at"])
          : null,
      updatedAt: json["updated_at"] != null
          ? DateTime.parse(json["updated_at"])
          : null,
    );
  }

  // =========================
  // To JSON
  // =========================
  Map<String, dynamic> toJson() {
    return {
      "title_ar": titleAr,
      "title_en": titleEn,
      "description_ar": descriptionAr,
      "description_en": descriptionEn,
      "service_id": serviceId,
      "original_price": originalPrice,
      "discount_type": discountType,
      "discount_value": discountValue,
      "sessions_count": sessionsCount,
      "bonus_sessions": bonusSessions,
      "image_url": imageUrl,
      "badge_text": badgeText,
      "start_date": startDate?.toIso8601String(),
      "end_date": endDate?.toIso8601String(),
      "status": status,
      "is_featured": isFeatured,
      "sort_order": sortOrder,
      "id": id,
      "final_price": finalPrice,
      "created_at": createdAt?.toIso8601String(),
      "updated_at": updatedAt?.toIso8601String(),
    };
  }

  // =========================
  // FormData (upload)
  // =========================
 Future<FormData> toFormData() async {
  final map = <String, dynamic>{};

  // Required fields
  map["title_ar"] = titleAr;
  map["description_ar"] = descriptionAr;
  map["service_id"] = serviceId;
  map["discount_type"] = discountType ?? "percentage";
  map["discount_value"] = discountValue;
  map["sessions_count"] = sessionsCount ?? 1;
  map["bonus_sessions"] = bonusSessions ?? 0;
  map["start_date"] = startDate?.toIso8601String().split("T").first;
  map["end_date"] = endDate?.toIso8601String().split("T").first;

  // Optional fields
  if (titleEn != null) map["title_en"] = titleEn;
  if (descriptionEn != null) map["description_en"] = descriptionEn;
  if (badgeText != null) map["badge_text"] = badgeText;
  if (status != null) map["status"] = status;

  map["is_featured"] = isFeatured;
  if (sortOrder != null) map["sort_order"] = sortOrder;
  if (id != null) map["id"] = id;
  if (finalPrice != null) map["final_price"] = finalPrice;

  // Image upload
  if (imageFile != null) {
    map["image"] = await MultipartFile.fromFile(
      imageFile!.path,
      filename: imageFile!.path.split('/').last,
    );
  }

  return FormData.fromMap(map);
}
}