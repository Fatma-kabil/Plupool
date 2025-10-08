import 'package:plupool/features/home/domain/entities/request_status.dart';

/// يمثل الطلب الواحد في النظام
class ServiceRequest {
  final String title;
  final String date;
  final String time;
  final String userName;
  final String userImage;
  final String location;
  final RequestStatus status;

  ServiceRequest({
    required this.title,
    required this.date,
    required this.time,
    required this.userName,
    required this.userImage,
    required this.location,
    required this.status,
  });
}
