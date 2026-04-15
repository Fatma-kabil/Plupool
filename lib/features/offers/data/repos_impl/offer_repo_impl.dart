import 'package:plupool/features/offers/data/models/offer_model.dart';
import 'package:plupool/features/offers/data/remote_data_sources/offer_remote_data_source.dart';
import 'package:plupool/features/offers/domain/enities/offer_entity.dart';
import 'package:plupool/features/offers/domain/repos/offer_repo.dart';
import 'package:plupool/features/products/data/models/product_params_model.dart';



class OfferRepoImpl implements OfferRepository {
  final OfferRemoteDataSource remote;

  OfferRepoImpl(this.remote);

  @override
  Future<List<OfferEntity>> getAllOffers(ProductParams params) async {
    final models = await remote.getAllOffers(params); // Future<List<OfferModel>>
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<OfferEntity> getOffer(int id) async {
    final model = await remote.getOffer(id); // OfferModel
    return model.toEntity();
  }

  @override
  Future<void> addOffer(OfferEntity offer) {
    return remote.addOffer(OfferModel.fromEntity(offer));
  }

  @override
  Future<void> updateOffer(OfferEntity offer) {
    return remote.updateOffer(OfferModel.fromEntity(offer));
  }

  @override
  Future<void> deleteOffer(int id) {
    return remote.deleteOffer(id);
  }
}
