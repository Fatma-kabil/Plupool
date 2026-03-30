import 'package:plupool/features/products/domain/entities/product_entity.dart';
import 'package:plupool/features/products/domain/repos/product_repo.dart';

class GetAllProductsUsecase {
  final ProductRepository repo;

  GetAllProductsUsecase(this.repo);

  Future<List<Product>> call() {
    return repo.getAllProducts();
  }
}