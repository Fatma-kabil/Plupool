import 'package:plupool/features/packages/data/models/visit_model.dart';
import 'package:plupool/features/packages/domain/entities/subscriber_entity.dart';

class SubscriberModel extends SubscriberEntity {
  SubscriberModel({
    required super.subscriptionId,
    required super.userId,
    required super.name,
    required super.phone,
    required super.status,
    required super.startDate,
    required super.endDate,
    required super.totalVisits,
    required super.completedVisits,
    required super.pendingVisits,
    required super.inProgressVisits,
    required super.scheduledVisits,
    required super.lastVisitDate,
    required super.nextVisitDate,
    required super.visits,

    super.nextVisitTime,
    super.nextVisitId,

    // Company Representative
    super.companyRepId,
    super.companyRepName,

    // Technicians
    super.technicianIds,
    super.technicianNames,
  });

  factory SubscriberModel.fromJson(Map<String, dynamic> json) {
    final nextVisit = json['next_visit'];

    return SubscriberModel(
      subscriptionId: json['subscription_id'] ?? 0,

      userId: json['user_id'] ?? 0,

      name: json['name'] ?? '',

      phone: json['phone'] ?? '',

      status: json['status'] ?? '',

      startDate: json['start_date'] ?? '',

      endDate: json['end_date'] ?? '',

      totalVisits: json['total_visits'] ?? 0,

      completedVisits: json['completed_visits'] ?? 0,

      pendingVisits: json['pending_visits'] ?? 0,

      inProgressVisits: json['in_progress_visits'] ?? 0,

      scheduledVisits: json['scheduled_visits'] ?? 0,

      lastVisitDate: json['last_visit_date'],

      // ==============================
      // Next Visit
      // ==============================
      nextVisitDate: nextVisit?['booking_date'],

      nextVisitTime: nextVisit?['booking_time'],

      nextVisitId: nextVisit?['booking_id'],

      // ==============================
      // Company Representative
      // ==============================
      companyRepId: json['company_rep_id'],

      companyRepName: json['company_rep_name'],

      // ==============================
      // Technicians
      // ==============================
      technicianIds:
          (json['technician_ids'] as List?)?.map((e) => e as int).toList() ??
          [],

      technicianNames:
          (json['technician_names'] as List?)
              ?.map((e) => e.toString())
              .toList() ??
          [],

      // ==============================
      // Visits
      // ==============================
      visits: (json['visits'] as List? ?? [])
          .map((e) => VisitModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
