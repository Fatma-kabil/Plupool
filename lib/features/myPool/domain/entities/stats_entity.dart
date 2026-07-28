class StatsEntity {
  final int services;
  final int packages;
  final int projects;
  final int inProgress;
  final int scheduled;
  final int urgent;
  final int completed;

  const StatsEntity({
    required this.services,
    required this.packages,
    required this.projects,
    required this.inProgress,
    required this.scheduled,
    required this.urgent,
    required this.completed,
  });
}