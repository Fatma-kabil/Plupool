class PackagesStatsEntity {
  final int inProgress;
  final int completed;
  final int scheduled;

  PackagesStatsEntity({
    required this.inProgress,
    required this.completed,
    required this.scheduled,
  });
}