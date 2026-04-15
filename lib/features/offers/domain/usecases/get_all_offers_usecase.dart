import 'package:plupool/features/offers/domain/enities/offer_entity.dart';
import 'package:plupool/features/offers/domain/repos/offer_repo.dart';
import 'package:plupool/features/products/data/models/product_params_model.dart';

class GetAllOffersUsecase {
  final OfferRepository repo;

  GetAllOffersUsecase(this.repo);

  Future<List<OfferEntity>> call(ProductParams params) {
    return repo.getAllOffers(params);
  }
}