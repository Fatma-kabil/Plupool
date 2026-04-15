
import 'package:plupool/features/offers/domain/repos/offer_repo.dart';

class DeleteOfferUsecase {
  final OfferRepository repo;

  DeleteOfferUsecase(this.repo);

  Future<void> call(int id) async {
    await repo.deleteOffer(id);
  }
}