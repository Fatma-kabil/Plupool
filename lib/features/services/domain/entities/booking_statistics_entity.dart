class BookingStatisticsEntity {
  final int urgent;
  final int scheduled;
  final int inProgress;
  final int completed;

  BookingStatisticsEntity({
    required this.urgent,
    required this.scheduled,
    required this.inProgress,
    required this.completed,
  });
}
