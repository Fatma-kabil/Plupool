import '../../domain/entities/package_progress_entity.dart';

class PackageProgressModel extends PackageProgressEntity {
  const PackageProgressModel({
    required super.message,
    required super.bookingId,
    required super.bookingStatus,
    required super.packageStatus,
    required super.progressPercentage,
    required super.totalVisits,
    required super.completedVisits,
    required super.remainingVisits,
  });

  factory PackageProgressModel.fromJson(Map<String, dynamic> json) {
    return PackageProgressModel(
      message: json['message'] ?? '',
      bookingId: json['booking_id'] ?? 0,
      bookingStatus: json['booking_status'] ?? '',
      packageStatus: json['package_status'] ?? '',
      progressPercentage: json['progress_percentage'] ?? 0,
      totalVisits: json['total_visits'] ?? 0,
      completedVisits: json['completed_visits'] ?? 0,
      remainingVisits: json['remaining_visits'] ?? 0,
    );
  }
}