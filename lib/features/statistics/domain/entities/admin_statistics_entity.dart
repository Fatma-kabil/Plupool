class AdminStatisticsEntity {
  final int totalOrders;
  final int activePackages;
  final int processBookings;
  final int totalReports;
  final int totalClients;
  final int totalTechnicians;

  const AdminStatisticsEntity({
    required this.totalOrders,
    required this.activePackages,
    required this.processBookings,
    required this.totalReports,
    required this.totalClients,
    required this.totalTechnicians,
  });
}