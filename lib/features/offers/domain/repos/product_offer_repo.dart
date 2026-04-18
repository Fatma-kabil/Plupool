import 'package:plupool/features/offers/domain/enities/product_offer_entity.dart';
import 'package:plupool/features/products/domain/entities/product_entity.dart';

 abstract class ProductOfferRepo {
  
  Future<void> addProductOffer(ProductOfferEntity productOffer);
  Future<void> updateProductOffer(ProductOfferEntity productOffer);
  Future<void> deleteProductOffer(int id);



  Future<List<Product>> getActiveOffers({
    int skip,
    int limit,
    List<int>? categoryIds, // ✅
  String? sortBy,
  String? search, 
  });
}
