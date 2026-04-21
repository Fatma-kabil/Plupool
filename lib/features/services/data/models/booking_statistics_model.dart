class BookingStatisticsModel {
  final int pending;
  final int confirmed;
  final int inProgress;
  final int completed;
  final int cancelled;
  final int rejected;

  BookingStatisticsModel({
    required this.pending,
    required this.confirmed,
    required this.inProgress,
    required this.completed,
    required this.cancelled,
    required this.rejected,
  });

  factory BookingStatisticsModel.fromJson(Map<String, dynamic> json) {
    return BookingStatisticsModel(
      pending: json['pending'] ?? 0,
      confirmed: json['confirmed'] ?? 0,
      inProgress: json['in_progress'] ?? 0,
      completed: json['completed'] ?? 0,
      cancelled: json['cancelled'] ?? 0,
      rejected: json['rejected'] ?? 0,
    );
  }
}