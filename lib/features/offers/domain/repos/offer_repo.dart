import 'package:plupool/features/offers/domain/enities/offer_entity.dart';
import 'package:plupool/features/products/data/models/product_params_model.dart';

abstract class OfferRepository {
  Future<List<OfferEntity>> getAllOffers(ProductParams params);
  Future<OfferEntity> getOffer(int id);
  Future<void> addOffer(OfferEntity offer);
  Future<void> updateOffer(OfferEntity offer);
  Future<void> deleteOffer(int id);
}