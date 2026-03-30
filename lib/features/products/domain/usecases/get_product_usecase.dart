import 'package:plupool/features/products/domain/repos/product_repo.dart';

import '../entities/product_entity.dart';

class GetProductUsecase {
  final ProductRepository repo;

  GetProductUsecase(this.repo);

  Future<Product> call(int id) async {
    return await repo.getProduct(id);
  }
}