class CreatePackageRequest {
  final String nameAr;
  final String? nameEn;
  final String? descriptionAr;
  final double price;
  final String duration;
  final int visitsCount;
  final int reminderDaysBefore;
  final bool isActive;
  final int userId;
  final String startDate;
  final String endDate;
  final List<String> maintenanceDays;
  final String bookingTime;
  final List<int> technicianIds;
  final String serviceStatus;
  final bool remindNextVisit;

  CreatePackageRequest({
    required this.nameAr,
    this.nameEn,
    this.descriptionAr,
    required this.price,
    required this.duration,
    required this.visitsCount,
    required this.reminderDaysBefore,
    required this.isActive,
    required this.userId,
    required this.startDate,
    required this.endDate,
    required this.maintenanceDays,
    required this.bookingTime,
    required this.technicianIds,
    required this.serviceStatus,
    required this.remindNextVisit,
  });

  Map<String, dynamic> toJson() {
    return {
      "name_ar": nameAr,
      "name_en": nameEn,
      "description_ar": descriptionAr,
      "price": price,
      "duration": duration,
      "visits_count": visitsCount,
      "reminder_days_before": reminderDaysBefore,
      "is_active": isActive,
      "user_id": userId,
      "start_date": startDate,
      "end_date": endDate,
      "maintenance_days": maintenanceDays,
      "booking_time": bookingTime,
      "technician_ids": technicianIds,
      "service_status": serviceStatus,
      "remind_next_visit": remindNextVisit,
    };
  }
}