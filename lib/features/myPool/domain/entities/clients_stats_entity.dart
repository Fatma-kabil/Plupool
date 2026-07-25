class ClientsStatsEntity {
  final int totalPools;
  final int activePackages;
  final int completedTasks;
  final int active;
  final int inactive;

  ClientsStatsEntity({
    required this.totalPools,
    required this.activePackages,
    required this.completedTasks,
    required this.active,
    required this.inactive,
  });
}