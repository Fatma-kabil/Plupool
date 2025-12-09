import 'package:plupool/features/home/domain/entities/request_status.dart';

class ProjectModel {
  final RequestStatus status;
  final int? progress;
  final String title;
  final String location;
  final String? nextVisitDate;
  final String? nextVisitDay;
  final String? nextVisitTime;
  final int nofpools;

  ProjectModel({
    required this.status,
    required this.progress,
    required this.title,
    required this.location,
     this.nextVisitDate,
     this.nextVisitDay,
     this.nextVisitTime,
    required this.nofpools,
  });
}
