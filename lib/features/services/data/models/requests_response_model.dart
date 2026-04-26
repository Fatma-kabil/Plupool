import '../../domain/entities/requests_response_entity.dart';
import 'service_request_model.dart';

class TabCountsModel extends TabCounts {
  TabCountsModel({
    required super.maintenance,
    required super.construction,
  });

  factory TabCountsModel.fromJson(Map<String, dynamic> json) {
    return TabCountsModel(
      maintenance: json['maintenance'] ?? 0,
      construction: json['construction'] ?? 0,
    );
  }
}

class RequestsResponseModel extends RequestsResponseEntity {
  RequestsResponseModel({
    required super.tabCounts,
    required super.requests,
    required super.total,
    required super.page,
    required super.limit,
    required super.totalPages,
  });

  factory RequestsResponseModel.fromJson(Map<String, dynamic> json) {
    return RequestsResponseModel(
      tabCounts: TabCountsModel.fromJson(json['tab_counts'] ?? {}),
      requests: (json['requests'] as List)
          .map((e) => ServiceRequestModel.fromJson(e))
          .toList(),
      total: json['total'] ?? 0,
      page: json['page'] ?? 1,
      limit: json['limit'] ?? 20,
      totalPages: json['total_pages'] ?? 0,
    );
  }
}