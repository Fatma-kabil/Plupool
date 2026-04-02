
import 'package:plupool/features/offers/domain/repos/product_offer_repo.dart';

class DeleteProductOfferUsecase {
   final ProductOfferRepo repo;

  DeleteProductOfferUsecase(this.repo);

  Future<void> call(int id) async {
    await repo.deleteProductOffer(id);
  }
}