import '../../domain/entities/maintenance_package_entity.dart';

class MaintenancePackageModel extends MaintenancePackageEntity {
  const MaintenancePackageModel({
    required super.id,
    required super.nameAr,
    required super.nameEn,
    required super.descriptionAr,
    required super.descriptionEn,
    required super.duration,
    required super.includedServices,
    required super.price,
    required super.visitsCount,
    required super.reminderDaysBefore,
    required super.isActive,
  });

  factory MaintenancePackageModel.fromJson(Map<String, dynamic> json) {
    return MaintenancePackageModel(
      id: json["id"] ?? 0,
      nameAr: json["name_ar"] ?? "",
      nameEn: json["name_en"] ?? "",
      descriptionAr: json["description_ar"] ?? "",
      descriptionEn: json["description_en"] ?? "",
      duration: json["duration"] ?? "",
     includedServices: json["included_services"] == null
    ? <String>[]
    : List<String>.from(json["included_services"]),
      price: (json["price"] ?? 0).toDouble(),
      visitsCount: json["visits_count"] ?? 0,
      reminderDaysBefore: json["reminder_days_before"] ?? 0,
      isActive: json["is_active"] ?? false,
    );
  }
}