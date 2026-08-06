class ServicesStatsEntity {
  final int services;
  final int packages;
  final int construction;

  final int scheduled;
  final int urgent;
  final int inProgress;
  final int completed;

  const ServicesStatsEntity({
    required this.services,
    required this.packages,
    required this.construction,
    required this.scheduled,
    required this.urgent,
    required this.inProgress,
    required this.completed,
  });
}