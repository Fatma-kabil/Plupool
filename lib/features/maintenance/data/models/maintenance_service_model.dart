import '../../domain/entities/maintenance_service_entity.dart';
import 'maintenance_section_model.dart';

class MaintenanceServiceModel extends MaintenanceServiceEntity {
  const MaintenanceServiceModel({
    required super.serviceId,
    required super.bookingType,
    required super.titleAr,
    required super.titleEn,
    required super.descriptionAr,
    required super.sections,
  });

  factory MaintenanceServiceModel.fromJson(Map<String, dynamic> json) {
    return MaintenanceServiceModel(
      serviceId: json['service_id'] ?? 0,
      bookingType: json['booking_type'] ?? '',
      titleAr: json['title_ar'] ?? '',
      titleEn: json['title_en'] ?? '',
      descriptionAr: json['description_ar'] ?? '',
      sections: (json['sections'] as List? ?? [])
          .map((e) => MaintenanceSectionModel.fromJson(e))
          .toList(),
    );
  }
}