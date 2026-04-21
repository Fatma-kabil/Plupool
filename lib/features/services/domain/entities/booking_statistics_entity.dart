class BookingStatisticsEntity {
  final int pending;
  final int confirmed;
  final int inProgress;
  final int completed;
  final int cancelled;
  final int rejected;

  BookingStatisticsEntity({
    required this.pending,
    required this.confirmed,
    required this.inProgress,
    required this.completed,
    required this.cancelled,
    required this.rejected,
  });
}