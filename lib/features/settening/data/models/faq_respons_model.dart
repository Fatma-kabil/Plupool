import 'package:plupool/features/settening/data/models/faq_model.dart';

class FaqResponseModel {
  final int total;
  final List<FaqModel> faqs;

  FaqResponseModel({
    required this.total,
    required this.faqs,
  });

  factory FaqResponseModel.fromJson(Map<String, dynamic> json) {
    return FaqResponseModel(
      total: json['total'],
      faqs: List<FaqModel>.from(
        json['faqs'].map((e) => FaqModel.fromJson(e)),
      ),
    );
  }
}