import 'dart:io';
import 'package:dio/dio.dart';
import 'package:plupool/features/products/data/models/badge_model.dart';
import 'package:plupool/features/products/domain/entities/product_entity.dart';

class ProductModel {
  final String nameAr;
  final String? nameEn;
  final String? descriptionAr;
  final String? descriptionEn;
  final int? categoryId;
  final int originalPrice;
  final String? discountType;
  final double? discountValue;
  final String? offerBadge;
  final DateTime? offerStartDate;
  final DateTime? offerEndDate;
  final String? imageUrl;
  final List<String>? images;
  final int stockQuantity;
  final String? deliveryTime;
  final bool freeDelivery;
  final double rating;
  final int reviewsCount;
  final String status;
  final bool? isFeatured;
  final int sortOrder;
  final int? id;
  final double finalPrice;
  final int viewsCount;
  final String? stockStatus;
  final bool hasOffer;
  final double discountPercentage;
  final bool? isOfferActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final File? imageFile;
  final List<File>? additionalFiles;
  final List<BadgeModel>? badges;

  ProductModel({
    required this.nameAr,
    this.nameEn,
    this.descriptionAr,
    this.descriptionEn,
    this.categoryId,
    required this.originalPrice,
    this.discountType,
    this.discountValue,
    this.offerBadge,
    this.offerStartDate,
    this.offerEndDate,
    this.imageUrl,
    this.images,
    required this.stockQuantity,
    this.deliveryTime,
    this.freeDelivery = false,
    this.rating = 0,
    this.reviewsCount = 0,
    this.status = "active",
    this.isFeatured = false,
    this.sortOrder = 0,
    this.id,
    this.finalPrice = 0,
    this.viewsCount = 0,
    this.stockStatus,
    this.hasOffer = false,
    this.discountPercentage = 0,
    this.isOfferActive,
    this.createdAt,
    this.updatedAt,
    this.imageFile,
    this.additionalFiles,
    this.badges,
  });
  Product toEntity() {
    return Product(
      offerStartDate: offerStartDate,
      offerEndDate: offerEndDate,
      isFeatured: isFeatured,
      hasOffer: hasOffer,
      hasActiveOffer: isOfferActive,
      stockStatus: stockStatus ?? "",
      discountValue: discountValue,
      imageUrl: imageUrl,
      id: id,
      name: nameAr,
      categoryId: categoryId ?? 0,
      price: originalPrice,
      stock: stockQuantity,
      image: imageFile ?? File(""),

      badges: badges == null
          ? []
          : badges!
                .map((e) => e.toEntity())
                .toList(), // لو مفيش صورة جديدة خليها فارغة (أو handle حسب احتياجك)
    );
  }

  /// 🔁 From Entity
  factory ProductModel.fromEntity(Product entity) {
    return ProductModel(
      offerStartDate: entity.offerStartDate,
      offerEndDate: entity.offerEndDate,
      isFeatured: entity.isFeatured ?? false,
      hasOffer: entity.hasOffer ?? false,
      discountValue: entity.discountValue,
      stockStatus: entity.stockStatus,
      imageUrl: entity.imageUrl,
      id: entity.id,
      nameAr: entity.name,
      categoryId: entity.categoryId,
      originalPrice: entity.price,
      stockQuantity: entity.stock,
      imageFile: entity.image,
      isOfferActive: entity.hasActiveOffer,
      badges: entity.badges
          ?.map((e) => BadgeModel(type: e.type, label: e.label, color: e.color))
          .toList(),
    );
  }

  /// From JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      nameAr: json["name_ar"] ?? "",
      nameEn: json["name_en"],
      descriptionAr: json["description_ar"],
      descriptionEn: json["description_en"],
      categoryId: json["category_id"],
      originalPrice: json["original_price"] ?? 0,
      discountType: json["discount_type"],
      discountValue: (json["discount_value"] != null)
          ? (json["discount_value"] as num).toDouble()
          : null,
      offerBadge: json["offer_badge"],
      offerStartDate: json["offer_start_date"] != null
          ? DateTime.parse(json["offer_start_date"])
          : null,
      offerEndDate: json["offer_end_date"] != null
          ? DateTime.parse(json["offer_end_date"])
          : null,
      imageUrl: json["image_url"],
      images: json["images"] != null ? List<String>.from(json["images"]) : null,
      stockQuantity: json["stock_quantity"] ?? 0,
      deliveryTime: json["delivery_time"],
      freeDelivery: json["free_delivery"] ?? false,
      rating: (json["rating"] != null) ? (json["rating"] as num).toDouble() : 0,
      reviewsCount: json["reviews_count"] ?? 0,
      status: json["status"] ?? "active",
      isFeatured: json["is_featured"] ?? false,
      sortOrder: json["sort_order"] ?? 0,
      id: json["id"] ?? 0,
      finalPrice: (json["final_price"] != null)
          ? (json["final_price"] as num).toDouble()
          : 0,
      viewsCount: json["views_count"] ?? 0,
      stockStatus: json["stock_status"],
      hasOffer: json["has_offer"] ?? false,
      discountPercentage: (json["discount_percentage"] != null)
          ? (json["discount_percentage"] as num).toDouble()
          : 0,
      isOfferActive: json["is_offer_active"] ?? false,
      createdAt: json["created_at"] != null
          ? DateTime.parse(json["created_at"])
          : null,
      updatedAt: json["updated_at"] != null
          ? DateTime.parse(json["updated_at"])
          : null,
      badges: json["badges"] != null
          ? List<BadgeModel>.from(
              json["badges"].map((x) => BadgeModel.fromJson(x)),
            )
          : null,
    );
  }

  /// To JSON
  Map<String, dynamic> toJson() {
    return {
      "name_ar": nameAr,
      if (nameEn != null) "name_en": nameEn,
      if (descriptionAr != null) "description_ar": descriptionAr,
      if (descriptionEn != null) "description_en": descriptionEn,
      if (categoryId != null) "category_id": categoryId,
      "original_price": originalPrice,
      if (discountType != null) "discount_type": discountType,
      if (discountValue != null) "discount_value": discountValue,
      if (offerBadge != null) "offer_badge": offerBadge,
      if (offerStartDate != null)
        "offer_start_date": offerStartDate!.toIso8601String(),
      if (offerEndDate != null)
        "offer_end_date": offerEndDate!.toIso8601String(),
      if (imageUrl != null) "image_url": imageUrl,
      if (images != null) "images": images,
      "stock_quantity": stockQuantity,
      if (deliveryTime != null) "delivery_time": deliveryTime,
      "free_delivery": freeDelivery,
      "rating": rating,
      "reviews_count": reviewsCount,
      "status": status,
      "is_featured": isFeatured,
      "sort_order": sortOrder,
      "id": id,
      "final_price": finalPrice,
      "views_count": viewsCount,
      if (stockStatus != null) "stock_status": stockStatus,
      "has_offer": hasOffer,
      "discount_percentage": discountPercentage,
      "is_offer_active": isOfferActive,
      if (createdAt != null) "created_at": createdAt!.toIso8601String(),
      if (updatedAt != null) "updated_at": updatedAt!.toIso8601String(),
    };
  }

  /// FormData for uploading images

  Future<FormData> toFormData() async {
    final map = <String, dynamic>{};

    map["name_ar"] = nameAr;
    if (categoryId != null) map["category_id"] = categoryId;
    map["original_price"] = originalPrice;
    map["stock_quantity"] = stockQuantity;

    if (imageFile != null) {
      map["image"] = await MultipartFile.fromFile(
        imageFile!.path,
        filename: imageFile!.path.split('/').last,
      );
    }

    return FormData.fromMap(map);
  }
}
