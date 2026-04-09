import 'package:plupool/core/error/failure.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/features/products/data/models/product_params_model.dart';

import '../../../../core/network/end_points.dart';
import '../models/product_model.dart';

class ProductRemoteDataSource {
  final ApiService api;

  ProductRemoteDataSource(this.api);

  /// ================= GET ALL =================
  Future<List<ProductModel>> getAllProducts(
  ProductParams params
  ) async {
    try {
      final response = await api.get(
        Endpoints.products,
        queryParams:  params.toQuery(),
      );

      return (response.data as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } catch (e) {
      throw mapDioError(e); // 🔥 هنا السحر
    }
  }

  /// ================= GET BY ID =================
  Future<ProductModel> getProduct(int id) async {
    try {
      final response = await api.get('${Endpoints.products}$id');

      return ProductModel.fromJson(response.data);
    } catch (e) {
      throw mapDioError(e); // 🔥 هنا السحر
    }
  }

  Future<void> addProduct(ProductModel product) async {
    final formData = await product.toFormData(); // FormData + الصور
     /// 🔥 حطي الـ debug هنا
  print("FIELDS:");
  for (var field in formData.fields) {
    print(field);
  }

  print("FILES:");
  for (var file in formData.files) {
    print(file.key);
    print(file.value.filename);
  }
    await api.post(Endpoints.products, data: formData);
  }

  /// ================= UPDATE =================
  Future<void> updateProduct(ProductModel product) async {
    final formData = await product.toFormData(); // FormData + الصور
    await api.put('${Endpoints.products}${product.id}', data: formData);
  }

  /// ================= DELETE =================
  Future<void> deleteProduct(int id) async {
    await api.delete('${Endpoints.products}$id');
  }
}
