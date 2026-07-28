import 'package:plupool/features/myPool/domain/entities/next_visit_entity.dart';
import 'package:plupool/features/myPool/domain/entities/user_service_entity.dart';

class PoolItemEntity {
  final String? tab;
  final String? bookingType;

  final int bookingId;

  final int? serviceId;
  final String? serviceName;

  final int? packageId;
  final String? packageName;
  final String? packageType;

  final String? projectName;

  final int clientId;
  final String clientName;
  final String clientPhone;
final String? clientAddress;
  final String? bookingDate;
  final String? bookingTime;

  final String? startDate;
  final String? endDate;

  final String status;
  final String statusLabel;

  final double? progressPercentage;
  final double? completionPercentage;

  final String? progressText;

  final int? visitsCount;
  final int? completedVisits;

  final int? poolsCount;

  final String? location;

  final List<String> includedServices;

  final List<VisitEntity>? visits;

  final List<TechnicianEntity> technicians;

  final NextVisitEntity? nextVisit;

  final String? imageUrl;

  final String? notes;

  final String createdAt;

  const PoolItemEntity({
    this.tab,
    this.bookingType,
    required this.bookingId,
    this.serviceId,
    this.serviceName,
    this.packageId,
    this.packageName,
    this.packageType,
    this.projectName,
    required this.clientId,
    required this.clientName,
    required this.clientPhone,
    this.clientAddress,
    this.bookingDate,
    this.bookingTime,
    this.startDate,
    this.endDate,
    required this.status,
    required this.statusLabel,
    this.progressPercentage,
    this.completionPercentage,
    this.progressText,
    this.visitsCount,
    this.completedVisits,
    this.poolsCount,
    this.location,
    required this.includedServices,
     this.visits,
    required this.technicians,
    this.nextVisit,
    this.imageUrl,
    this.notes,
    required this.createdAt,
  });
}