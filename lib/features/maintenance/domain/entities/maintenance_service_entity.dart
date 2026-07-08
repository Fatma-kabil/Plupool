import 'maintenance_section_entity.dart';

class MaintenanceServiceEntity {
  final int serviceId;
  final String bookingType;
  final String titleAr;
  final String titleEn;
  final String descriptionAr;
  final List<MaintenanceSectionEntity> sections;

  const MaintenanceServiceEntity({
    required this.serviceId,
    required this.bookingType,
    required this.titleAr,
    required this.titleEn,
    required this.descriptionAr,
    required this.sections,
  });
}