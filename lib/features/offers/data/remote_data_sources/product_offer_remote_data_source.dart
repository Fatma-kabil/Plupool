import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/features/offers/data/models/product_offer_model.dart';
import 'package:plupool/features/products/data/models/product_model.dart';

import '../../../../core/network/end_points.dart';

class ProductOfferRemoteDataSource {
  final ApiService api;

  ProductOfferRemoteDataSource({required this.api});
  Future<List<ProductModel>> getActiveOffers({
    int skip = 0,
    int limit = 100,
    int? categoryId,
    String? sortBy,
  }) async {
    final response = await api.get(
      Endpoints.productOffers,
      queryParams: {
        'skip': skip,
        'limit': limit,
        if (categoryId != null) 'category_id': categoryId,
        if (sortBy != null) 'sort_by': sortBy,
      },
    );

    final List data = response.data;

    return data.map((e) => ProductModel.fromJson(e)).toList();
  }

  Future<void> addProductOffer(ProductOfferModel product) async {
    final body = product.toJson();
    print("SEND OFFER => $body");
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
    await api.delete('${Endpoints.products}$id/offer');
  }
}
