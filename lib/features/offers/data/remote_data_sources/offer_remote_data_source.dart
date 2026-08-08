import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/offers/data/models/offer_model.dart';
import 'package:plupool/features/products/data/models/product_params_model.dart';

class OfferRemoteDataSource {
  final ApiService api;

  OfferRemoteDataSource(this.api);

  /// ================= GET ALL =================
  /// ❌ بدون توكن
  Future<List<OfferModel>> getAllOffers(ProductParams params) async {
    try {
      final response = await api.get(
        Endpoints.offers,
        queryParams: params.toQuery(),
      );
      print("GET PRODUCTS RESPONSE => ${response.data}");

      return (response.data as List)
          .map((e) => OfferModel.fromJson(e))
          .toList();
    } catch (e) {
      throw mapDioError(e); // 🔥 هنا السحر
    }
  }

  /// ================= GET BY ID =================
  /// 🔐 بالتوكن
  Future getOffer(int id) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    final response = await api.get(
      '${Endpoints.offers}$id',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    return OfferModel.fromJson(response.data);
  }

  /// ================= ADD =================
  /// 🔐 بالتوكن
  Future addOffer(OfferModel offer) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    final formData = await offer.toFormData();

    print("FIELDS:");
    for (var field in formData.fields) {
      print(field);
    }

    print("FILES:");
    for (var file in formData.files) {
      print(file.key);
      print(file.value.filename);
    }

    await api.post(
      Endpoints.offers,
      data: formData,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }

  /// ================= UPDATE =================
  /// 🔐 بالتوكن
  Future updateOffer(OfferModel offer) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    final formData = await offer.toFormData();

    await api.put(
      '${Endpoints.offers}${offer.id}',
      data: formData,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }

  /// ================= DELETE =================
  /// 🔐 بالتوكن
  Future deleteOffer(int id) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    await api.delete(
      '${Endpoints.offers}$id',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }
}
