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
  final String? nextVisitTime; // الجديد

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
    this.nextVisitTime, // الجديد
    required this.visits,
    this.nextVisitId
  });
}
