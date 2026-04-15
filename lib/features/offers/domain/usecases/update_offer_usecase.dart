import 'package:plupool/features/offers/domain/enities/offer_entity.dart';
import 'package:plupool/features/offers/domain/repos/offer_repo.dart';


class UpdateOfferUsecase {
  final OfferRepository repo;

  UpdateOfferUsecase(this.repo);

  Future<void> call(OfferEntity offer) async {
    await repo.updateOffer(offer);
  }
}