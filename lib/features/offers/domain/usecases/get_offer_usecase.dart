
import 'package:plupool/features/offers/domain/enities/offer_entity.dart';
import 'package:plupool/features/offers/domain/repos/offer_repo.dart';

class GetOfferUsecase {
  final OfferRepository repo;

  GetOfferUsecase(this.repo);

  Future<OfferEntity> call(int id) async {
    return await repo.getOffer(id);
  }
}