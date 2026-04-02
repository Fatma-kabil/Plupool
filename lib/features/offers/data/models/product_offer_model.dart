import 'package:plupool/features/offers/domain/enities/product_offer_entity.dart';

class ProductOfferModel extends ProductOfferEntity {
  ProductOfferModel({
    required super.id,
    required super.productName,
    required super.startOffer,
    required super.endOffer,
    required super.offervalue,
  });
  factory ProductOfferModel.fromJson(Map<String, dynamic> json) {
    return ProductOfferModel(
      id: json['id'],
      productName: json['name'] ?? '',
      startOffer: json['startoffer'],
      endOffer: json['endoffer'],
      offervalue: json['offervalue'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": productName,
      "offervalue": offervalue,
      "start_date": startOffer.toIso8601String(),
      "end_date": startOffer.toIso8601String(),
    };
  }
}
