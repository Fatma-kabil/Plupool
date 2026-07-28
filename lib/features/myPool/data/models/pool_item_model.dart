import 'package:plupool/features/myPool/data/models/next_visit_model.dart';
import 'package:plupool/features/myPool/data/models/user_services_model.dart';
import 'package:plupool/features/myPool/domain/entities/pool_item_entity.dart';

class PoolItemModel extends PoolItemEntity {
  const PoolItemModel({
    super.tab,
    super.bookingType,
    required super.bookingId,

    super.serviceId,
    super.serviceName,

    super.packageId,
    super.packageName,
    super.packageType,

    super.projectName,

    required super.clientId,
    required super.clientName,
    required super.clientPhone,
    super.clientAddress,

    super.bookingDate,
    super.bookingTime,

    super.startDate,
    super.endDate,

    super.visitsCount,
    super.completedVisits,
    super.progressPercentage,
    super.progressText,

    super.visits,

    super.location,
    super.poolsCount,
    super.completionPercentage,

    required super.status,
    required super.statusLabel,

    super.nextVisit,

    required super.technicians,

    super.notes,

    super.imageUrl,

    required super.createdAt,
    required super.includedServices,
  });

  factory PoolItemModel.fromJson(Map<String, dynamic> json) {
    return PoolItemModel(
      tab: json['tab'],

      bookingType: json['booking_type'],

      bookingId: json['booking_id'] ?? 0,

      serviceId: json['service_id'],

      serviceName: json['service_name'],

      packageId: json['package_id'],

      packageName: json['package_name'],

      packageType: json['package_type'],

      projectName: json['project_name'],

      clientId: json['client_id'] ?? 0,

      clientName: json['client_name'] ?? '',

      clientPhone: json['client_phone'] ?? '',

      clientAddress: json['client_address'],

      bookingDate: json['booking_date'],

      bookingTime: json['booking_time'],

      startDate: json['start_date'],

      endDate: json['end_date'],

      visitsCount: json['visits_count'],

      completedVisits: json['completed_visits'],

      progressPercentage: json['progress_percentage'] == null
          ? null
          : (json['progress_percentage'] as num).toDouble(),

      progressText: json['progress_text'],

      visits:
          (json['visits'] as List?)
              ?.map((e) => VisitModel.fromJson(e))
              .toList() ??
          const [],

      location: json['location'],

      poolsCount: json['pools_count'],

      completionPercentage: json['completion_percentage'] == null
          ? null
          : (json['completion_percentage'] as num).toDouble(),

      status: json['status'] ?? '',

      statusLabel: json['status_label'] ?? '',

      nextVisit: json['next_visit'] == null
          ? null
          : NextVisitModel.fromJson(json['next_visit']),

      technicians:
          (json['technicians'] as List?)
              ?.map((e) => TechnicianModel.fromJson(e))
              .toList() ??
          const [],

      notes: json['notes'],

      imageUrl: json['image_url'],

      createdAt: json['created_at'] ?? '',
      includedServices:
          (json['included_services'] as List?)
              ?.map((e) => e.toString())
              .toList() ??
          const [],
    );
  }

  PoolItemEntity toEntity() => this;
}
