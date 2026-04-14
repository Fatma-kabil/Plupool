import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/products/data/models/product_model.dart';

class ProductSearchRemoteDataSource {
  final ApiService api;

  ProductSearchRemoteDataSource(this.api);

  Future<List<ProductModel>> searchProducts({
    required String query,
    int skip = 0,
  
  }) async {
    final response = await api.get(
      Endpoints.productSearch,
      queryParams: {'q': query, 'skip': skip, },
    );

    return (response.data as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }
}
