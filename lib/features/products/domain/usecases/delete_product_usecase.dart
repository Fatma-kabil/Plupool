import 'package:plupool/features/products/domain/repos/product_repo.dart';



class DeleteProductUsecase {
  final ProductRepository repo;

  DeleteProductUsecase(this.repo);

  Future<void> call(int id) async {
    await repo.deleteProduct(id);
  }
}