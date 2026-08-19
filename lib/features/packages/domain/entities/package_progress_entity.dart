class PackageProgressEntity {
  final String message;
  final int bookingId;
  final String bookingStatus;
  final String packageStatus;
  final int progressPercentage;
  final int totalVisits;
  final int completedVisits;
  final int remainingVisits;

  const PackageProgressEntity({
    required this.message,
    required this.bookingId,
    required this.bookingStatus,
    required this.packageStatus,
    required this.progressPercentage,
    required this.totalVisits,
    required this.completedVisits,
    required this.remainingVisits,
  });
}