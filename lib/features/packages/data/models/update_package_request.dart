class UpdatePackageRequest {
  final String? nameAr;
  final String? nameEn;
  final String? descriptionAr;
  final double? price;
  final String? duration;
  final int? visitsCount;
  final int? reminderDaysBefore;
  final bool? isActive;

  final int? userId;
  final int? companyRepId;

  final String? startDate;
  final String? endDate;

  final List<String>? maintenanceDays;
  final String? bookingTime;
  final List<int>? technicianIds;

  final String? serviceStatus;
  final bool? remindNextVisit;

  final bool? replaceVisits;

  /// بنستخدمها عشان نفرق بين:
  /// company_rep_id مش متبعت
  /// و company_rep_id = null
  final Set<String> fieldsToSend;

  const UpdatePackageRequest({
    this.nameAr,
    this.nameEn,
    this.descriptionAr,
    this.price,
    this.duration,
    this.visitsCount,
    this.reminderDaysBefore,
    this.isActive,
    this.userId,
    this.companyRepId,
    this.startDate,
    this.endDate,
    this.maintenanceDays,
    this.bookingTime,
    this.technicianIds,
    this.serviceStatus,
    this.remindNextVisit,
    this.replaceVisits,
    this.fieldsToSend = const {},
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (fieldsToSend.contains('name_ar')) {
      data['name_ar'] = nameAr;
    }

    if (fieldsToSend.contains('name_en')) {
      data['name_en'] = nameEn;
    }

    if (fieldsToSend.contains('description_ar')) {
      data['description_ar'] = descriptionAr;
    }

    if (fieldsToSend.contains('price')) {
      data['price'] = price;
    }

    if (fieldsToSend.contains('duration')) {
      data['duration'] = duration;
    }

    if (fieldsToSend.contains('visits_count')) {
      data['visits_count'] = visitsCount;
    }

    if (fieldsToSend.contains('reminder_days_before')) {
      data['reminder_days_before'] = reminderDaysBefore;
    }

    if (fieldsToSend.contains('is_active')) {
      data['is_active'] = isActive;
    }

    if (fieldsToSend.contains('user_id')) {
      data['user_id'] = userId;
    }

    if (fieldsToSend.contains('company_rep_id')) {
      data['company_rep_id'] = companyRepId;
    }

    if (fieldsToSend.contains('start_date')) {
      data['start_date'] = startDate;
    }

    if (fieldsToSend.contains('end_date')) {
      data['end_date'] = endDate;
    }

    if (fieldsToSend.contains('maintenance_days')) {
      data['maintenance_days'] = maintenanceDays;
    }

    if (fieldsToSend.contains('booking_time')) {
      data['booking_time'] = bookingTime;
    }

    if (fieldsToSend.contains('technician_ids')) {
      data['technician_ids'] = technicianIds;
    }

    if (fieldsToSend.contains('service_status')) {
      data['service_status'] = serviceStatus;
    }

    if (fieldsToSend.contains('remind_next_visit')) {
      data['remind_next_visit'] = remindNextVisit;
    }

    if (fieldsToSend.contains('replace_visits')) {
      data['replace_visits'] = replaceVisits;
    }

    return data;
  }
}