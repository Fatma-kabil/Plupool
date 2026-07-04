class UserServiceEntity {
  final String bookingType;
  final String tab;
  final String title;
  final String subtitle;
  final String status;
  final String statusLabel;
  final String scheduledDate;
  final String scheduledTime;
  final List<TechnicianEntity> technicians;
  final bool canEdit;
  final bool canDelete;

  UserServiceEntity({
    required this.bookingType,
    required this.tab,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.statusLabel,
    required this.scheduledDate,
    required this.scheduledTime,
    required this.technicians,
    required this.canEdit,
    required this.canDelete,
  });
}

class TechnicianEntity {
  final String name;
  final String phone;
  final String? profileImage;

  TechnicianEntity({
    required this.name,
    required this.phone,
    this.profileImage,
  });
}