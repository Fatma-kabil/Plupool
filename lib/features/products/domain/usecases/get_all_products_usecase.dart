import 'package:plupool/features/products/data/models/product_params_model.dart';
import 'package:plupool/features/products/domain/entities/product_entity.dart';
import 'package:plupool/features/products/domain/repos/product_repo.dart';

class GetAllProductsUsecase {
  final ProductRepository repo;

  GetAllProductsUsecase(this.repo);

  Future<List<Product>> call(ProductParams params) {
    return repo.getAllProducts( params);
  }
}