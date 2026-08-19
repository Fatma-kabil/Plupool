import 'package:plupool/features/packages/domain/entities/visit_entity.dart';

class SubscriberEntity {
  final int subscriptionId;
  final int userId;

  final String name;
  final String phone;
  final String status;

  final String startDate;
  final String endDate;

  final int totalVisits;
  final int completedVisits;
  final int pendingVisits;
  final int inProgressVisits;
  final int scheduledVisits;

  final int? nextVisitId;
  final String? lastVisitDate;
  final String? nextVisitDate;
  final String? nextVisitTime;

  // ==============================
  // Company Representative
  // ==============================

  final int? companyRepId;
  final String? companyRepName;

  // ==============================
  // Technicians
  // ==============================

  final List<int> technicianIds;
  final List<String> technicianNames;
  final int bookingId;
  final List<VisitEntity> visits;

  const SubscriberEntity({
    required this.subscriptionId,
    required this.userId,
    required this.name,
    required this.phone,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.totalVisits,
    required this.completedVisits,
    required this.pendingVisits,
    required this.inProgressVisits,
    required this.scheduledVisits,
    required this.lastVisitDate,
    required this.nextVisitDate,
    required this.bookingId,
    this.nextVisitTime,
    this.nextVisitId,

    // Company Representative
    this.companyRepId,
    this.companyRepName,

    // Technicians
    this.technicianIds = const [],
    this.technicianNames = const [],

    required this.visits,
  });
}
