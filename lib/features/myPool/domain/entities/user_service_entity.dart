class UserServiceEntity {
  final int id;
  final String bookingType;
  final String tab;
  final String title;
  final String subtitle;
  final String status;
  final String statusLabel;
  final String scheduledDate;
  final String scheduledTime;
  final String? endDate;
  final String? nextMaintenanceDate;
  final String? nextMaintenanceTime;
  final int visitsCount;
  final int completedVisits;
  final int progressPercentage;
  final List<VisitEntity> visits;
  final List<TechnicianEntity> technicians;
  final bool canEdit;
  final bool canDelete;
  final String createdAt;

  UserServiceEntity({
    required this.id,
    required this.bookingType,
    required this.tab,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.statusLabel,
    required this.scheduledDate,
    required this.scheduledTime,
    this.endDate,
    this.nextMaintenanceDate,
    this.nextMaintenanceTime,
    required this.visitsCount,
    required this.completedVisits,
    required this.progressPercentage,
    required this.visits,
    required this.technicians,
    required this.canEdit,
    required this.canDelete,
    required this.createdAt,
  });
}

class TechnicianEntity {
  final int id;
  final String name;
  final String phone;
  final String? profileImage;

  TechnicianEntity({
    required this.id,
    required this.name,
    required this.phone,
    this.profileImage,
  });
}

class VisitEntity {
  final int id;
  final String title;
  final String scheduledDate;
  final String scheduledTime;
  final String status;
  final String statusLabel;
  final TechnicianEntity technician;
  final String? notes;

  VisitEntity({
    required this.id,
    required this.title,
    required this.scheduledDate,
    required this.scheduledTime,
    required this.status,
    required this.statusLabel,
    required this.technician,
    this.notes,
  });
}