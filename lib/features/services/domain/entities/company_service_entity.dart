class CompanyServiceEntity {
  final int bookingId;

  // Service / Package
  final int? serviceId;
  final int? packageId;

  final String name;
  final String? packageType;
  final List<String> includedServices;

  // Client
  final int clientId;
  final String clientName;
  final String clientPhone;
  final String clientAddress;

  // Dates
  final String? bookingDate;
  final String? bookingTime;

  final String? startDate;
  final String? endDate;

  // Package Progress
  final int? visitsCount;
  final int? completedVisits;
  final double? progressPercentage;
  final String? progressText;

  // Status
  final String status;
  final String statusLabel;

  // Next Visit
  final NextVisitEntity? nextVisit;

  // Technicians
  final List<TechnicianEntity> technicians;

  final String? notes;
  final String? imageUrl;

  final String createdAt;

  const CompanyServiceEntity({
    required this.bookingId,
    this.serviceId,
    this.packageId,
    required this.name,
    this.packageType,
    this.includedServices = const [],
    required this.clientId,
    required this.clientName,
    required this.clientPhone,
    required this.clientAddress,
    this.bookingDate,
    this.bookingTime,
    this.startDate,
    this.endDate,
    this.visitsCount,
    this.completedVisits,
    this.progressPercentage,
    this.progressText,
    required this.status,
    required this.statusLabel,
    this.nextVisit,
    required this.technicians,
    this.notes,
    this.imageUrl,
    required this.createdAt,
  });
}

class NextVisitEntity {
  final String date;
  final String time;
  final bool reminder;

  const NextVisitEntity({
    required this.date,
    required this.time,
    required this.reminder,
  });
}

class TechnicianEntity {
  final int id;
  final String name;
  final String phone;
  final String? profileImage;

  const TechnicianEntity({
    required this.id,
    required this.name,
    required this.phone,
    this.profileImage,
  });
}