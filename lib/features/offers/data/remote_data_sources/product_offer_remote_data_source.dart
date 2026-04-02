
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/features/offers/data/models/product_offer_model.dart';

import '../../../../core/network/end_points.dart';

class ProductOfferRemoteDataSource {
   final ApiService api;

  ProductOfferRemoteDataSource({required this.api});
    Future<void> addProductOffer(ProductOfferModel product) async {
    await api.post(
      '${Endpoints.products}${product.id}/offer',
      data: product.toJson(),
    );
  }

  /// ================= UPDATE =================
  Future<void> updateProductOffer(ProductOfferModel product) async {
    await api.put(
      '${Endpoints.products}${product.id}/offer',
      data: product.toJson(),
    );
  }

  /// ================= DELETE =================
  Future<void> deleteProductOffer(int id) async {
    await api.delete(
      '${Endpoints.products}$id/offer',
    );
  }
}
