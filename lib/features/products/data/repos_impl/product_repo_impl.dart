
import 'package:plupool/features/products/data/remote_data_sources/product_remote_data_source.dart';
import 'package:plupool/features/products/domain/entities/product_entity.dart';
import 'package:plupool/features/products/domain/repos/product_repo.dart';

import '../models/product_model.dart';

class ProductRepoImpl implements ProductRepository {
  final ProductRemoteDataSource remote;

  ProductRepoImpl(this.remote);

  @override
  Future<List<Product>> getAllProducts() {
    return remote.getAllProducts();
  }

  @override
  Future<Product> getProduct(int id) {
    return remote.getProduct(id);
  }

  @override
  Future<void> addProduct(Product product) {
    return remote.addProduct(product as ProductModel);
  }

  @override
  Future<void> updateProduct(Product product) {
    return remote.updateProduct(product as ProductModel);
  }

  @override
  Future<void> deleteProduct(int id) {
    return remote.deleteProduct(id);
  }
}