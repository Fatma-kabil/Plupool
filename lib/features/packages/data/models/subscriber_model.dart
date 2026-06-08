import 'package:plupool/features/packages/data/models/visit_model.dart';

import '../../domain/entities/subscriber_entity.dart';

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
    required super.visits,
  });

  factory SubscriberModel.fromJson(Map<String, dynamic> json) {
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
      visits: (json['visits'] as List? ?? [])
    .map((e) => VisitModel.fromJson(e))
    .toList(),
    );
  }
}