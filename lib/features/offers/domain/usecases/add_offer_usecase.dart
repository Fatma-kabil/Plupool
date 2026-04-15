
import 'package:plupool/features/offers/domain/enities/offer_entity.dart';
import 'package:plupool/features/offers/domain/repos/offer_repo.dart';

class AddOfferUsecase {
  final OfferRepository repo;

  AddOfferUsecase(this.repo);

  Future<void> call(OfferEntity offer) async {
    await repo.addOffer(offer);
  }
}