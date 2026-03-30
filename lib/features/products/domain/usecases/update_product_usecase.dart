import 'package:plupool/features/products/domain/repos/product_repo.dart';

import '../entities/product_entity.dart';

class UpdateProductUsecase {
  final ProductRepository repo;

  UpdateProductUsecase(this.repo);

  Future<void> call(Product product) async {
    await repo.updateProduct(product);
  }
}