import 'package:plupool/core/error/failure.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/offers/data/models/offer_model.dart';

import 'package:plupool/features/products/data/models/product_params_model.dart';

class OfferRemoteDataSource {
  final ApiService api;

  OfferRemoteDataSource(this.api);

  /// ================= GET ALL =================
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
  Future<OfferModel> getOffer(int id) async {
    try {
      final response = await api.get('${Endpoints.offers}$id');

      return OfferModel.fromJson(response.data);
    } catch (e) {
      throw mapDioError(e); // 🔥 هنا السحر
    }
  }

  Future<void> addOffer(OfferModel offer) async {
    final formData = await offer.toFormData(); // FormData + الصور
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
    await api.post(Endpoints.offers, data: formData);
  }

  /// ================= UPDATE =================
  Future<void> updateOffer(OfferModel offer) async {
    final formData = await offer.toFormData(); // FormData + الصور
    //  print("UPDATE RESPONSE: ${response.data}");
    await api.patch('${Endpoints.offers}${offer.id}', data: formData);
  }

  /// ================= DELETE =================
  Future<void> deleteOffer(int id) async {
    await api.delete('${Endpoints.offers}$id');
  }
}
