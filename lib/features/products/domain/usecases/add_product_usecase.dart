import 'package:plupool/features/products/domain/repos/product_repo.dart';

import '../entities/product_entity.dart';

class AddProductUsecase {
  final ProductRepository repo;

  AddProductUsecase(this.repo);

  Future<void> call(Product product) async {
    await repo.addProduct(product);
  }
}