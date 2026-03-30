
import 'package:plupool/core/network/api_service.dart';

import '../../../../core/network/end_points.dart';
import '../models/product_model.dart';

class ProductRemoteDataSource {
  final ApiService api;

  ProductRemoteDataSource(this.api);

  /// ================= GET ALL =================
  Future<List<ProductModel>> getAllProducts({
    int skip = 0,
    int limit = 10,
    String? search,
  }) async {
    final response = await api.get(
      Endpoints.products,
      queryParams: {
        "skip": skip,
        "limit": limit,
        if (search != null) "search": search,
      },
    );

    return (response.data as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  /// ================= GET BY ID =================
  Future<ProductModel> getProduct(int id) async {
    final response = await api.get(
      '${Endpoints.products}$id',
    );

    return ProductModel.fromJson(response.data);
  }

  /// ================= ADD =================
  Future<void> addProduct(ProductModel product) async {
    await api.post(
      Endpoints.products,
      data: product.toJson(),
    );
  }

  /// ================= UPDATE =================
  Future<void> updateProduct(ProductModel product) async {
    await api.put(
      '${Endpoints.products}${product.id}',
      data: product.toJson(),
    );
  }

  /// ================= DELETE =================
  Future<void> deleteProduct(int id) async {
    await api.delete(
      '${Endpoints.products}$id',
    );
  }
}