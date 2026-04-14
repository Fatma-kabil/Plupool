import 'package:plupool/features/products/domain/entities/product_entity.dart';
import 'package:plupool/features/search/data/data_sources/product_search_remote_data_source.dart';
import 'package:plupool/features/search/domain/repositories/product_search_repo.dart';

class ProductSearchRepositoryImpl implements ProductSearchRepository {
  final ProductSearchRemoteDataSource remote;

  ProductSearchRepositoryImpl(this.remote);

  @override
  Future<List<Product>> searchProducts(
    String query, {
    int skip = 0,
    int limit = 20,
  }) async {
    final result = await remote.searchProducts(query: query, skip: skip);

    return result.map((e) => e.toEntity()).toList();
  }
}