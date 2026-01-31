import 'package:plupool/core/utils/functions/request_status.dart';

class AdminProjectModel {
  final String projectTitle;
  final String location;
  final DateTime startDate;
  final DateTime finishedDate;
  final DateTime nextVisit;
  final int totalPools;
  final int finshiedPools;
  final RequestStatus status;

  AdminProjectModel({
    required this.projectTitle,
    required this.location,
    required this.startDate,
    required this.finishedDate,
    required this.nextVisit,
    required this.totalPools,
    required this.finshiedPools,
    required this.status,
  });
}
