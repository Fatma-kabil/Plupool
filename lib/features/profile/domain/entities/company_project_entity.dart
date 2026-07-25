class CompanyProjectEntity {
  final int bookingId;
  final String projectName;
  final int clientId;
  final String clientName;
  final String clientPhone;
  final String location;
  final int poolsCount;
  final double completionPercentage;
  final String status;
  final String statusLabel;
  final String startDate;
  final String endDate;
  final String? imageUrl;
  final String createdAt;

  const CompanyProjectEntity({
    required this.bookingId,
    required this.projectName,
    required this.clientId,
    required this.clientName,
    required this.clientPhone,
    required this.location,
    required this.poolsCount,
    required this.completionPercentage,
    required this.status,
    required this.statusLabel,
    required this.startDate,
    required this.endDate,
    this.imageUrl,
    required this.createdAt,
  });
}