import 'package:plupool/features/statistics/domain/entities/admin_statistics_entity.dart';

class AdminStatisticsModel extends AdminStatisticsEntity {
  final int newOrders;
  final int completedOrders;
  final int cancelledOrders;
  final int totalProducts;
  final int activeOffers;
  final int totalRatings;
  final int pendingOrders;
  final int availableProducts;
  final int incompleteOrders;
  final int unavailableProducts;
  final int totalPackages;

  const AdminStatisticsModel({
    required super.totalOrders,
    required super.activePackages,
    required super.processBookings,
    required super.totalReports,
    required super.totalClients,
    required super.totalTechnicians,
    required super.activeClients,
    required super.inactiveClients,
    required super.inactivePackages,

    required this.newOrders,
    required this.completedOrders,
    required this.cancelledOrders,
    required this.totalProducts,
    required this.activeOffers,
    required this.totalRatings,
    required this.pendingOrders,
    required this.availableProducts,
    required this.incompleteOrders,
    required this.unavailableProducts,
    required this.totalPackages,
  });

  factory AdminStatisticsModel.fromJson(Map<String, dynamic> json) {
    return AdminStatisticsModel(
      totalOrders: json['total_orders'] ?? 0,
      activePackages: json['active_packages'] ?? 0,
      processBookings: json['process_bookings'] ?? 0,
      totalReports: json['total_reports'] ?? 0,
      totalClients: json['total_clients'] ?? 0,
      totalTechnicians: json['total_technicians'] ?? 0,
      activeClients: json['active_clients'] ?? 0,
      inactiveClients: json['inactive_clients'] ?? 0,
      inactivePackages: json['inactive_packages'] ?? 0,

      newOrders: json['new_orders'] ?? 0,
      completedOrders: json['completed_orders'] ?? 0,
      cancelledOrders: json['cancelled_orders'] ?? 0,
      totalProducts: json['total_products'] ?? 0,
      activeOffers: json['active_offers'] ?? 0,
      totalRatings: json['total_ratings'] ?? 0,
      pendingOrders: json['pending_orders'] ?? 0,
      availableProducts: json['available_products'] ?? 0,
      incompleteOrders: json['incomplete_orders'] ?? 0,
      unavailableProducts: json['unavailable_products'] ?? 0,
      totalPackages: json['total_packages'] ?? 0,
    );
  }
}