import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/settening/data/models/faq_model.dart';
import 'package:plupool/features/settening/data/models/faq_respons_model.dart';

class FaqRemoteDataSource {
  final ApiService api;

  FaqRemoteDataSource(this.api);

  /// GET ALL FAQS
  Future<FaqResponseModel> getFaqs({
    String? role,
    String? category,
    bool? isActive,
  }) async {
    final response = await api.get(
      Endpoints.faq,
      queryParams: {
        if (role != null) "role": role,
        if (category != null) "category": category,
        if (isActive != null) "is_active": isActive,
      },
    );

    return FaqResponseModel.fromJson(response.data);
  }

  /// CREATE FAQ
  Future<void> createFaq(FaqModel model) async {
    await api.post(Endpoints.faq, data: model.toJson());
  }

  /// UPDATE FAQ
  Future<FaqModel> updateFaq(FaqModel model) async {
    final response = await api.put(
    "${Endpoints.faq}/${model.id}",
      data: model.toJson(),
    );

    return FaqModel.fromJson(response.data);
  }

  /// GET SINGLE FAQ
  Future<FaqModel> getFaq(int id) async {
    final response = await api.get("${Endpoints.faq}/$id");

    return FaqModel.fromJson(response.data);
  }

  /// DELETE FAQ
  Future<void> deleteFaq(int id) async {
    await api.delete("${Endpoints.faq}/$id");
  }

  /// TOGGLE VISIBILITY
  Future<FaqModel> toggleFaq(int id, bool isActive) async {
    final response = await api.patch(
      "${Endpoints.faq}/$id/toggle-visibility",
      data: {"is_active": isActive},
    );

    return FaqModel.fromJson(response.data);
  }
}
