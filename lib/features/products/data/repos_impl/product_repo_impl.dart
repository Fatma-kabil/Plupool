import 'package:plupool/features/products/data/models/product_params_model.dart';
import 'package:plupool/features/products/data/remote_data_sources/product_remote_data_source.dart';
import 'package:plupool/features/products/domain/entities/product_entity.dart';
import 'package:plupool/features/products/domain/repos/product_repo.dart';

import '../models/product_model.dart';

class ProductRepoImpl implements ProductRepository {
  final ProductRemoteDataSource remote;

  ProductRepoImpl(this.remote);

  @override
  Future<List<Product>> getAllProducts(ProductParams params) async {
    final models = await remote.getAllProducts(params); // Future<List<ProductModel>>
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<Product> getProduct(int id) async {
    final model = await remote.getProduct(id); // ProductModel
    return model.toEntity();
  }

  @override
  Future<void> addProduct(Product product) {
    return remote.addProduct(ProductModel.fromEntity(product));
  }

  @override
  Future<void> updateProduct(Product product) {
    return remote.updateProduct(ProductModel.fromEntity(product));
  }

  @override
  Future<void> deleteProduct(int id) {
    return remote.deleteProduct(id);
  }
}
