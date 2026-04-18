class AdminStatisticsEntity {
  final int totalOrders;
  final int activePackages;
  final int processBookings;
  final int totalReports;
  final int totalClients;
  final int totalTechnicians;
  final int activeClients;
  final int inactiveClients;
  final int renewedPackages;
  final int inactivePackages;

  const AdminStatisticsEntity({
    required this.totalOrders,
    required this.activePackages,
    required this.processBookings,
    required this.totalReports,
    required this.totalClients,
    required this.totalTechnicians,
    required this.activeClients,
    required this.inactiveClients,
   required this.renewedPackages,
    required this.inactivePackages,
  });
}