class MaintenancePackageEntity {
  final int id;
  final String nameAr;
  final String nameEn;
  final String descriptionAr;
  final String descriptionEn;
  final String duration;
  final List<String> includedServices;
  final double price;
  final int visitsCount;
  final int reminderDaysBefore;
  final bool isActive;

  const MaintenancePackageEntity({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.duration,
    required this.includedServices,
    required this.price,
    required this.visitsCount,
    required this.reminderDaysBefore,
    required this.isActive,
  });
}