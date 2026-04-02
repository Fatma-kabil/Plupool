import 'package:plupool/features/offers/data/models/product_offer_model.dart';
import 'package:plupool/features/offers/data/remote_data_sources/product_offer_remote_data_source.dart';
import 'package:plupool/features/offers/domain/enities/product_offer_entity.dart';
import 'package:plupool/features/offers/domain/repos/product_offer_repo.dart';

class ProductOfferRepoImpl implements ProductOfferRepo {
  final ProductOfferRemoteDataSource remote;

  ProductOfferRepoImpl({required this.remote});
  @override
  Future<void> addProductOffer(ProductOfferEntity productoffer) {
    return remote.addProductOffer(productoffer as ProductOfferModel);
  }

  @override
  Future<void> updateProductOffer(ProductOfferEntity product) {
    return remote.updateProductOffer(product as ProductOfferModel);
  }

  @override
  Future<void> deleteProductOffer(int id) {
    return remote.deleteProductOffer(id);
  }
}
