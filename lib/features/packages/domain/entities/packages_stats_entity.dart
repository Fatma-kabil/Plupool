class PackagesStatsEntity {
  final int inProgress;
  final int completed;
  final int scheduled;
  final int pending;

  PackagesStatsEntity({
    required this.inProgress,
    required this.completed,
    required this.scheduled,
    required this.pending,
  });
}