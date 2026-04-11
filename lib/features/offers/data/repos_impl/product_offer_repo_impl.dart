import 'package:plupool/features/offers/data/models/product_offer_model.dart';
import 'package:plupool/features/offers/data/remote_data_sources/product_offer_remote_data_source.dart';
import 'package:plupool/features/offers/domain/enities/product_offer_entity.dart';
import 'package:plupool/features/offers/domain/repos/product_offer_repo.dart';
class ProductOfferRepoImpl implements ProductOfferRepo {
  final ProductOfferRemoteDataSource remote;

  ProductOfferRepoImpl({required this.remote});

  @override
  Future<void> addProductOffer(ProductOfferEntity productoffer) {
    final model = ProductOfferModel(
      id: productoffer.id,
      discountType: productoffer.discountType,
      discountValue: productoffer.discountValue,
      offerBadge: productoffer.offerBadge,
      offerStartDate: productoffer.offerStartDate,
      offerEndDate: productoffer.offerEndDate,
      isFeatured: productoffer.isFeatured,
    );

    return remote.addProductOffer(model);
  }

  @override
  Future<void> updateProductOffer(ProductOfferEntity product) {
    final model = ProductOfferModel(
      id: product.id,
      discountType: product.discountType,
      discountValue: product.discountValue,
      offerBadge: product.offerBadge,
      offerStartDate: product.offerStartDate,
      offerEndDate: product.offerEndDate,
      isFeatured: product.isFeatured,
    );

    return remote.updateProductOffer(model);
  }

  @override
  Future<void> deleteProductOffer(int id) {
    return remote.deleteProductOffer(id);
  }
}