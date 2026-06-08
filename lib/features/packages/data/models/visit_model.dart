import '../../domain/entities/visit_entity.dart';

class VisitModel extends VisitEntity {
  VisitModel({
    required super.bookingId,
    required super.bookingDate,
    required super.bookingTime,
    required super.status,
    required super.adminNotes,
  });

  factory VisitModel.fromJson(Map<String, dynamic> json) {
    return VisitModel(
      bookingId: json['booking_id'] ?? 0,
      bookingDate: json['booking_date'] ?? '',
      bookingTime: json['booking_time'] ?? '',
      status: json['status'] ?? '',
      adminNotes: json['admin_notes'],
    );
  }
}