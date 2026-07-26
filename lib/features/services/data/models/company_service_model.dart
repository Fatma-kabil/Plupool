import '../../domain/entities/company_service_entity.dart';

class CompanyServiceModel extends CompanyServiceEntity {
  const CompanyServiceModel({
    required super.bookingId,
    super.serviceId,
    super.packageId,
    required super.name,
    super.packageType,
    super.includedServices,
    required super.clientId,
    required super.clientName,
    required super.clientPhone,
    required super.clientAddress,
    super.bookingDate,
    super.bookingTime,
    super.startDate,
    super.endDate,
    super.visitsCount,
    super.completedVisits,
    super.progressPercentage,
    super.progressText,
    required super.status,
    required super.statusLabel,
    super.nextVisit,
    required super.technicians,
    super.notes,
    super.imageUrl,
    required super.createdAt,
  });

  factory CompanyServiceModel.fromJson(Map<String, dynamic> json) {
    return CompanyServiceModel(
      bookingId: json["booking_id"] ?? 0,

      serviceId: json["service_id"],
      packageId: json["package_id"],

      name: (json["service_name"] ?? json["package_name"] ?? "").toString(),

      packageType: json["package_type"]?.toString(),

      includedServices: (json["included_services"] as List?)
              ?.map((e) => e.toString())
              .toList() ??
          [],

      clientId: json["client_id"] ?? 0,
      clientName: (json["client_name"] ?? "").toString(),
      clientPhone: (json["client_phone"] ?? "").toString(),
      clientAddress: (json["client_address"] ?? "").toString(),

      bookingDate: json["booking_date"]?.toString(),
      bookingTime: json["booking_time"]?.toString(),

      startDate: json["start_date"]?.toString(),
      endDate: json["end_date"]?.toString(),

      visitsCount: json["visits_count"],
      completedVisits: json["completed_visits"],

      progressPercentage: json["progress_percentage"] == null
          ? null
          : (json["progress_percentage"] as num).toDouble(),

      progressText: json["progress_text"]?.toString(),

      status: (json["status"] ?? "").toString(),
      statusLabel: (json["status_label"] ?? "").toString(),

      nextVisit: json["next_visit"] == null
          ? null
          : NextVisitModel.fromJson(
              json["next_visit"] as Map<String, dynamic>,
            ),

      technicians: (json["technicians"] as List?)
              ?.map(
                (e) => TechnicianModel.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],

      notes: json["notes"]?.toString(),
      imageUrl: json["image_url"]?.toString(),

      createdAt: (json["created_at"] ?? "").toString(),
    );
  }
}

class NextVisitModel extends NextVisitEntity {
  const NextVisitModel({
    required super.date,
    required super.time,
    required super.reminder,
  });

  factory NextVisitModel.fromJson(Map<String, dynamic> json) {
    return NextVisitModel(
      date: (json["date"] ?? "").toString(),
      time: (json["time"] ?? "").toString(),
      reminder: json["reminder"] ?? false,
    );
  }
}

class TechnicianModel extends TechnicianEntity {
  const TechnicianModel({
    required super.id,
    required super.name,
    required super.phone,
    super.profileImage,
  });

  factory TechnicianModel.fromJson(Map<String, dynamic> json) {
    return TechnicianModel(
      id: json["id"] ?? 0,
      name: (json["name"] ?? "").toString(),
      phone: (json["phone"] ?? "").toString(),
      profileImage: json["profile_image"]?.toString(),
    );
  }
}