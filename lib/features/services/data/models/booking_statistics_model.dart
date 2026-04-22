class BookingStatisticsModel {
  final int urgent;
  final int scheduled;
  final int inProgress;
  final int completed;

  BookingStatisticsModel({
    required this.inProgress,
    required this.completed,
    required this.urgent,
    required this.scheduled,
  });

  factory BookingStatisticsModel.fromJson(Map<String, dynamic> json) {
    return BookingStatisticsModel(
      urgent: json['urgent'] ?? 0,
      scheduled: json['scheduled'] ?? 0,
      inProgress: json['in_progress'] ?? 0,
      completed: json['completed'] ?? 0,
    );
  }
}
