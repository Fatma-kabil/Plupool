import 'package:plupool/features/products/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllProducts();
  Future<Product> getProduct(int id);
  Future<void> addProduct(Product product);
  Future<void> updateProduct(Product product);
  Future<void> deleteProduct(int id);
}