import 'package:plupool/features/services/domain/entities/user_booking_entity.dart';

class BookingUserModel {
  final int id;
  final Map<String, dynamic> user;
  final String bookingDate;
  final String bookingTime;
  final String status;
  final String bookingType;
  final String? serviceName;
  final int? serviceId;
  final List<String>? technicianNames;

  final int? visitCount;
  final int? completedVisits;
  final Map<String, dynamic>? nextVisit;

  BookingUserModel({
    required this.id,
    required this.user,
    required this.bookingDate,
    required this.bookingTime,
    required this.status,
    required this.bookingType,
    required this.technicianNames,
    this.serviceName,
    this.serviceId,
    this.visitCount,
    this.completedVisits,
    this.nextVisit,
  });

  factory BookingUserModel.fromJson(Map<String, dynamic> json) {
    return BookingUserModel(
      id: (json['id'] ?? 0) is int
          ? json['id']
          : int.tryParse(json['id'].toString()) ?? 0,

      user: json['user'] is Map<String, dynamic>
          ? json['user']
          : {},

      bookingDate: json['booking_date'] ?? '',
      bookingTime: json['booking_time'] ?? '',
      status: json['status'] ?? '',
      bookingType: json['booking_type_label'] ?? '',
      serviceName: json['service_name'],
      serviceId: json['service_id'] is int
          ? json['service_id']
          : int.tryParse(json['service_id']?.toString() ?? ''),

      technicianNames:
          List<String>.from(json['technician_names'] ?? []),

      visitCount: json['visit_count'],
      completedVisits: json['completed_visits'],

      nextVisit: json['next_visit'] is Map<String, dynamic>
          ? json['next_visit']
          : null,
    );
  }

  UserBookingEntity toEntity() {
    return UserBookingEntity(
      id: id,
      userName: user['name'] ?? '',
      userRole: user['role'] ?? '',
      date: bookingDate,
      time: bookingTime,
      status: status,
      bookingType: bookingType,
      serviceName: serviceName,
      serviceId: serviceId,
      technicians: technicianNames,
      visitCount: visitCount,
      completedVisits: completedVisits,
      nextVisitDate: nextVisit?['booking_date'] ?? '',
      nextVisitTime: nextVisit?['booking_time'] ?? '',
    );
  }
}