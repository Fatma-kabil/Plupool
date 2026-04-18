import 'package:plupool/features/products/domain/entities/product_entity.dart';

import '../repos/product_offer_repo.dart';

class GetActiveOffersUseCase {
  final ProductOfferRepo repo;

  GetActiveOffersUseCase(this.repo);

  Future<List<Product>> call({
    int skip = 0,
    int limit = 100,
     List<int>? categoryIds, // ✅
  String? sortBy,
  String? search, 
  }) {
    return repo.getActiveOffers(
      skip: skip,
      limit: limit,
      categoryIds: categoryIds,
      sortBy: sortBy,
      search: search

    );
  }
}