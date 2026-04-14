import 'package:plupool/features/products/domain/entities/product_entity.dart';

abstract class ProductSearchRepository {
  Future<List<Product>> searchProducts(
    String query, {
    int skip,
    int limit,
  });
}