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
  final List<int>? technicianIds;

  final int? visitCount;
  final int? completedVisits;

  final String? companyRepName;

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
    this.technicianIds,
    this.companyRepName,
  });

  factory BookingUserModel.fromJson(Map<String, dynamic> json) {
    final companyRep = json['company_rep'];

    return BookingUserModel(
      id: (json['id'] ?? 0) is int
          ? json['id']
          : int.tryParse(json['id'].toString()) ?? 0,

      user: json['user'] is Map<String, dynamic> ? json['user'] : {},

      bookingDate: json['booking_date']?.toString() ?? '',

      bookingTime: json['booking_time']?.toString() ?? '',

      status: json['status']?.toString() ?? '',

      bookingType:
          json['booking_type_label']?.toString() ??
          json['booking_type']?.toString() ??
          '',

      serviceName: json['service_name']?.toString(),

      serviceId: json['service_id'] is int
          ? json['service_id']
          : int.tryParse(json['service_id']?.toString() ?? ''),

      technicianNames:
          (json['technician_names'] as List?)
              ?.map((e) => e.toString())
              .toList() ??
          [],

      technicianIds:
          (json['technician_ids'] as List?)
              ?.map((e) => e is int ? e : int.tryParse(e.toString()))
              .whereType<int>()
              .toList() ??
          [],

      visitCount: json['visit_count'] is int
          ? json['visit_count']
          : int.tryParse(json['visit_count']?.toString() ?? ''),

      completedVisits: json['completed_visits'] is int
          ? json['completed_visits']
          : int.tryParse(json['completed_visits']?.toString() ?? ''),

      nextVisit: json['next_visit'] is Map<String, dynamic>
          ? json['next_visit']
          : null,

      // ⭐ هنا الحل
      companyRepName: companyRep is Map<String, dynamic>
          ? companyRep['name']?.toString()
          : null,
    );
  }

  UserBookingEntity toEntity() {
    return UserBookingEntity(
      id: id,

      userName: user['name']?.toString() ?? '',

      userRole: user['role']?.toString() ?? '',

      userId: user['id'] is int
          ? user['id']
          : int.tryParse(user['id']?.toString() ?? '') ?? 0,

      date: bookingDate,

      time: bookingTime,

      status: status,

      bookingType: bookingType,

      serviceName: serviceName,

      serviceId: serviceId,

      technicians: technicianNames,

      techniciansIds: technicianIds,

      visitCount: visitCount,

      completedVisits: completedVisits,

      nextVisitDate: nextVisit?['booking_date']?.toString(),

      nextVisitTime: nextVisit?['booking_time']?.toString(),

      companyRepName: companyRepName,
    );
  }
}
