

import 'package:plupool/features/offers/domain/enities/product_offer_entity.dart';

class ProductOfferModel extends ProductOfferEntity {
  ProductOfferModel({
    required super.id,
    required super.discountType,
    required super.discountValue,
    required super.offerBadge,
    required super.offerStartDate,
    required super.offerEndDate,
    required super.isFeatured,
  });

  factory ProductOfferModel.fromJson(Map<String, dynamic> json) {
    return ProductOfferModel(
      id: json['id'] ,
      discountType: json['discount_type'] ?? '',
      discountValue: (json['discount_value'] ?? 0).toDouble(),
      offerBadge: json['offer_badge'] ?? '',
      offerStartDate: DateTime.parse(json['offer_start_date']),
      offerEndDate: DateTime.parse(json['offer_end_date']),
      isFeatured: json['is_featured'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'discount_type': discountType,
      'discount_value': discountValue,
      'offer_badge': offerBadge,
      'offer_start_date': offerStartDate.toIso8601String(),
      'offer_end_date': offerEndDate.toIso8601String(),
      'is_featured': isFeatured,
    };
  }
}