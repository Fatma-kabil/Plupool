import 'package:plupool/features/visits/domain/entities/booking_visits_entity.dart';

class BookingVisitsModel extends BookingVisitsEntity {
  const BookingVisitsModel({
    required super.sourceBookingId,
    required super.packageId,
    required super.packageName,
    required super.userId,

    // ================= IDs =================
    super.currentVisitBookingId,
    super.latestCompletedVisitBookingId,
    super.latestCompletedReadingId,

    required super.total,
    required super.visits,
  });

  factory BookingVisitsModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return BookingVisitsModel(
      // ================= Basic Data =================

      sourceBookingId: json['source_booking_id'] ?? 0,

      packageId: json['package_id'] ?? 0,

      packageName: json['package_name'] ?? '',

      userId: json['user_id'] ?? 0,

      // ================= Visit IDs =================

      currentVisitBookingId: json['current_visit_booking_id'],

      latestCompletedVisitBookingId:
          json['latest_completed_visit_booking_id'],

      latestCompletedReadingId:
          json['latest_completed_reading_id'],

      // ================= Total =================

      total: json['total'] ?? 0,

      // ================= Visits =================

      visits: (json['visits'] as List<dynamic>? ?? [])
          .map(
            (e) => PackageVisitModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }
}

// ================================================================
// Package Visit Model
// ================================================================

class PackageVisitModel extends PackageVisitEntity {
  const PackageVisitModel({
    required super.visitNumber,
    required super.bookingId,
    super.packageId,
    super.userId,
    super.userName,
    super.bookingDate,
    super.bookingTime,
    required super.status,
    required super.statusLabel,
    super.taskId,
    super.readingId,
    required super.technicianIds,
    required super.technicianNames,
    super.chlorinePpm,
    super.phLevel,
    super.temperatureC,
    super.notes,
    super.recordedAt,
    super.idealRanges,
    required super.canAddReading,
    required super.canEditLatestReading,
    required super.readings,
  });

  factory PackageVisitModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return PackageVisitModel(
      // ================= Visit Info =================

      visitNumber: json['visit_number'] ?? 0,

      bookingId: json['booking_id'] ?? 0,

      packageId: json['package_id'],

      userId: json['user_id'],

      userName: json['user_name'],

      bookingDate: json['booking_date'],

      bookingTime: json['booking_time'],

      // ================= Status =================

      status: json['status'] ?? '',

      statusLabel: json['status_label'] ?? '',

      // ================= Task / Reading =================

      taskId: json['task_id'],

      readingId: json['reading_id'],

      // ================= Technicians =================

      technicianIds:
          (json['technician_ids'] as List<dynamic>? ?? [])
              .map((e) => _toInt(e))
              .toList(),

      technicianNames:
          (json['technician_names'] as List<dynamic>? ?? [])
              .map((e) => e.toString())
              .toList(),

      // ================= Reading Values =================

      chlorinePpm: _toDouble(
        json['chlorine_ppm'],
      ),

      phLevel: _toDouble(
        json['ph_level'],
      ),

      temperatureC: _toDouble(
        json['temperature_c'],
      ),

      // ================= Notes / Date =================

      notes: json['notes'],

      recordedAt: json['recorded_at'],

      // ================= Ideal Ranges =================

      idealRanges: json['ideal_ranges'] != null
          ? IdealRangesModel.fromJson(
              json['ideal_ranges'] as Map<String, dynamic>,
            )
          : null,

      // ================= Permissions =================

      canAddReading:
          json['can_add_reading'] ?? false,

      canEditLatestReading:
          json['can_edit_latest_reading'] ?? false,

      // ================= Readings =================

      readings:
          (json['readings'] as List<dynamic>? ?? [])
              .map(
                (e) => ReadingModel.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
    );
  }
}

// ================================================================
// Ideal Ranges Model
// ================================================================

class IdealRangesModel extends IdealRangesEntity {
  const IdealRangesModel({
    super.chlorinePpm,
    super.phLevel,
    super.temperatureC,
  });

  factory IdealRangesModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return IdealRangesModel(
      chlorinePpm: json['chlorine_ppm'],

      phLevel: json['ph_level'],

      temperatureC: json['temperature_c'],
    );
  }
}

// ================================================================
// Reading Model
// ================================================================

class ReadingModel extends ReadingEntity {
  const ReadingModel({
    required super.id,
    super.taskId,
    super.technicianId,
    super.technicianName,
    super.chlorinePpm,
    super.phLevel,
    super.temperatureC,
    super.notes,
    super.recordedAt,
  });

  factory ReadingModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ReadingModel(
      id: json['id'] ?? 0,

      taskId: json['task_id'],

      technicianId: json['technician_id'],

      technicianName: json['technician_name'],

      chlorinePpm: _toDouble(
        json['chlorine_ppm'],
      ),

      phLevel: _toDouble(
        json['ph_level'],
      ),

      temperatureC: _toDouble(
        json['temperature_c'],
      ),

      notes: json['notes'],

      recordedAt: json['recorded_at'],
    );
  }
}

// ================================================================
// Helpers
// ================================================================

int _toInt(dynamic value) {
  if (value is int) {
    return value;
  }

  return int.tryParse(
        value.toString(),
      ) ??
      0;
}

double? _toDouble(dynamic value) {
  if (value == null) {
    return null;
  }

  if (value is num) {
    return value.toDouble();
  }

  return double.tryParse(
    value.toString(),
  );
}