import 'package:plupool/features/products/domain/entities/product_entity.dart';
import 'package:plupool/features/search/domain/repositories/product_search_repo.dart';

class SearchProductsUseCase {
  final ProductSearchRepository repo;

  SearchProductsUseCase(this.repo);

  Future<List<Product>> call(String query, {int skip = 0}) {
    return repo.searchProducts(query, skip: skip);
  }
}
