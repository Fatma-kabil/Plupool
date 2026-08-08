import 'package:plupool/core/error/failure.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/features/products/data/models/product_params_model.dart';

import '../../../../core/network/end_points.dart';
import '../models/product_model.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:dio/dio.dart';

class ProductRemoteDataSource {
  final ApiService api;

  ProductRemoteDataSource(this.api);

  /// ================= GET ALL =================
  Future<List<ProductModel>> getAllProducts(ProductParams params) async {
    try {
      final response = await api.get(
        Endpoints.products,
        queryParams: params.toQuery(),
      );
      print("GET PRODUCTS RESPONSE => ${response.data}");

      return (response.data as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } catch (e) {
      throw mapDioError(e); // 🔥 هنا السحر
    }
  }

  /// ================= GET BY ID =================
  Future<ProductModel> getProduct(int id) async {
     final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');
    try {
      final response = await api.get('${Endpoints.products}$id',
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      return ProductModel.fromJson(response.data);
    } catch (e) {
      throw mapDioError(e); // 🔥 هنا السحر
    }
  }

  Future<void> addProduct(ProductModel product) async {
     final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');
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
    await api.post(Endpoints.products, data: formData, options: Options(headers: {'Authorization': 'Bearer $token'}));
  }

  /// ================= UPDATE =================
  Future<void> updateProduct(ProductModel product) async {
     final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');
    final formData = await product.toFormData(); // FormData + الصور
    //  print("UPDATE RESPONSE: ${response.data}");
    await api.patch(
      '${Endpoints.products}${product.id}/update-with-image',
      data: formData,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }

  /// ================= DELETE =================
  Future<void> deleteProduct(int id) async {
      final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');
    await api.delete('${Endpoints.products}$id', options: Options(headers: {'Authorization': 'Bearer $token'}));
  }
}
