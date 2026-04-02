import 'package:plupool/features/offers/domain/enities/product_offer_entity.dart';
import 'package:plupool/features/offers/domain/repos/product_offer_repo.dart';

class AddProductOfferUsecase {
  final ProductOfferRepo repo;

  AddProductOfferUsecase(this.repo);

  Future<void> call(ProductOfferEntity productoffer) async {
    await repo.addProductOffer(productoffer);
  }
}
