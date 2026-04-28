import 'package:plupool/features/services/domain/entities/service_request_entity.dart';

class TabCounts {
  final int maintenance;
  final int construction;
  final int newCounts;

  TabCounts({required this.maintenance, required this.construction ,required this.newCounts
  });
}

class RequestsResponseEntity {
  final TabCounts tabCounts;
  final List<ServiceRequestEntity> requests;
  final int total;
  final int page;
  final int limit;
  final int totalPages;

  RequestsResponseEntity({
    required this.tabCounts,
    required this.requests,
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
 
 });
}