import '../../domain/entities/admin_statistics_entity.dart';

class AdminStatisticsModel extends AdminStatisticsEntity {
  const AdminStatisticsModel({
    required super.totalOrders,
    required super.activePackages,
    required super.processBookings,
    required super.totalReports,
    required super.totalClients,
    required super.totalTechnicians,
  });

  factory AdminStatisticsModel.fromJson(Map<String, dynamic> json) {
    return AdminStatisticsModel(
      totalOrders: json['total_orders'] ?? 0,
      activePackages: json['active_packages'] ?? 0,
      processBookings: json['process_bookings'] ?? 0,
      totalReports: json['total_reports'] ?? 0,
      totalClients: json['total_clients'] ?? 0,
      totalTechnicians: json['total_technicians'] ?? 0,
    );
  }
}