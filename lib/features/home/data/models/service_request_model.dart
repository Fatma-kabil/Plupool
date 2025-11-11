import 'package:plupool/features/home/domain/entities/request_status.dart';

/// يمثل الطلب الواحد في النظام
class ServiceRequest {
  final String title;
  final String date;
  final String time;
  final String? userName;
  final String? userImage;
  final String? location;
  final RequestStatus status;
  final int? progress;
  final int? visits;
  final String? nextVisitDate;
  final String? nextVisitDay;
  final String? nextVisitTime;

  const ServiceRequest({
    required this.title,
    required this.date,
    required this.time,
    this.userName,
    this.userImage,
    this.location,
    required this.status,
    this.progress,
    this.visits,
    this.nextVisitDate,
    this.nextVisitDay,
    this.nextVisitTime,
  });
}
