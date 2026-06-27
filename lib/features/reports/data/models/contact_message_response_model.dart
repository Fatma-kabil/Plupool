import 'package:plupool/features/reports/data/models/contact_statistcs_model.dart';
import 'package:plupool/features/reports/domain/entities/contact_mesage_response.dart';

import 'contact_message_model.dart';

class ContactMessagesResponseModel
    extends ContactMessagesResponse {
  ContactMessagesResponseModel({
    required super.total,
    required super.statistics,
    required super.messages,
    required super.skip,
    required super.limit,
  });

  factory ContactMessagesResponseModel.fromJson(
      Map<String, dynamic> json) {
    return ContactMessagesResponseModel(
      total: json['total'],
      statistics:
          ContactStatisticsModel.fromJson(json['statistics']),
      messages: (json['messages'] as List)
          .map((e) => ContactMessageModel.fromJson(e))
          .toList(),
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}