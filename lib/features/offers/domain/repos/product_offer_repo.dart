import 'package:plupool/features/offers/domain/enities/product_offer_entity.dart';

 abstract class ProductOfferRepo {
  
  Future<void> addProductOffer(ProductOfferEntity productOffer);
  Future<void> updateProductOffer(ProductOfferEntity productOffer);
  Future<void> deleteProductOffer(int id);
}