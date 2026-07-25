import '../../domain/entities/company_project_entity.dart';

class CompanyProjectModel extends CompanyProjectEntity {
  const CompanyProjectModel({
    required super.bookingId,
    required super.projectName,
    required super.clientId,
    required super.clientName,
    required super.clientPhone,
    required super.location,
    required super.poolsCount,
    required super.completionPercentage,
    required super.status,
    required super.statusLabel,
    required super.startDate,
    required super.endDate,
    super.imageUrl,
    required super.createdAt,
  });

  factory CompanyProjectModel.fromJson(Map<String, dynamic> json) {
    return CompanyProjectModel(
      bookingId: json['booking_id'] ?? 0,
      projectName: json['project_name'] ?? '',
      clientId: json['client_id'] ?? 0,
      clientName: json['client_name'] ?? '',
      clientPhone: json['client_phone'] ?? '',
      location: json['location'] ?? '',
      poolsCount: json['pools_count'] ?? 0,
     completionPercentage:
    (json['completion_percentage'] as num?)?.toDouble() ?? 0.0,
      status: json['status'] ?? '',
      statusLabel: json['status_label'] ?? '',
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'] ?? '',
      imageUrl: json['image_url'],
      createdAt: json['created_at'] ?? '',
    );
  }
}