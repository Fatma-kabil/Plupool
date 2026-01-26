import 'package:plupool/core/utils/functions/request_status.dart';

class PackageModel {
  final String packageType;
  final DateTime finishedDate;
  final int totalVisits;
  final int finshiedVisites;
  final RequestStatus status;

  PackageModel({
    required this.packageType,
    required this.totalVisits,
    required this.finshiedVisites,
    required this.status,
    required this.finishedDate
  });
}
