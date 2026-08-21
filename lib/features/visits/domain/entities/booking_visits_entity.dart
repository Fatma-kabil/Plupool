import 'package:equatable/equatable.dart';

class BookingVisitsEntity extends Equatable {
  final int sourceBookingId;
  final int packageId;
  final String packageName;
  final int userId;

  // ================= IDs المهمة للإضافة والتعديل =================

  /// الزيارة الحالية اللي المفروض نضيف لها Reading
  final int? currentVisitBookingId;

  /// آخر زيارة مكتملة اللي مسموح نعدل آخر Reading فيها
  final int? latestCompletedVisitBookingId;

  /// آخر Reading مكتوب في آخر زيارة مكتملة
  final int? latestCompletedReadingId;

  final int total;
  final List<PackageVisitEntity> visits;

  const BookingVisitsEntity({
    required this.sourceBookingId,
    required this.packageId,
    required this.packageName,
    required this.userId,
    this.currentVisitBookingId,
    this.latestCompletedVisitBookingId,
    this.latestCompletedReadingId,
    required this.total,
    required this.visits,
  });

  @override
  List<Object?> get props => [
        sourceBookingId,
        packageId,
        packageName,
        userId,
        currentVisitBookingId,
        latestCompletedVisitBookingId,
        latestCompletedReadingId,
        total,
        visits,
      ];
}

// ================================================================
// Package Visit
// ================================================================

class PackageVisitEntity extends Equatable {
  final int visitNumber;
  final int bookingId;

  final int? packageId;
  final int? userId;
  final String? userName;

  final String? bookingDate;
  final String? bookingTime;

  final String status;
  final String statusLabel;

  final int? taskId;
  final int? readingId;

  final List<int> technicianIds;
  final List<String> technicianNames;

  final double? chlorinePpm;
  final double? phLevel;
  final double? temperatureC;

  final String? notes;
  final String? recordedAt;

  final IdealRangesEntity? idealRanges;

  final bool canAddReading;
  final bool canEditLatestReading;

  final List<ReadingEntity> readings;

  const PackageVisitEntity({
    required this.visitNumber,
    required this.bookingId,
    this.packageId,
    this.userId,
    this.userName,
    this.bookingDate,
    this.bookingTime,
    required this.status,
    required this.statusLabel,
    this.taskId,
    this.readingId,
    required this.technicianIds,
    required this.technicianNames,
    this.chlorinePpm,
    this.phLevel,
    this.temperatureC,
    this.notes,
    this.recordedAt,
    this.idealRanges,
    required this.canAddReading,
    required this.canEditLatestReading,
    required this.readings,
  });

  @override
  List<Object?> get props => [
        visitNumber,
        bookingId,
        packageId,
        userId,
        userName,
        bookingDate,
        bookingTime,
        status,
        statusLabel,
        taskId,
        readingId,
        technicianIds,
        technicianNames,
        chlorinePpm,
        phLevel,
        temperatureC,
        notes,
        recordedAt,
        idealRanges,
        canAddReading,
        canEditLatestReading,
        readings,
      ];
}

// ================================================================
// Ideal Ranges
// ================================================================

class IdealRangesEntity extends Equatable {
  final String? chlorinePpm;
  final String? phLevel;
  final String? temperatureC;

  const IdealRangesEntity({
    this.chlorinePpm,
    this.phLevel,
    this.temperatureC,
  });

  @override
  List<Object?> get props => [
        chlorinePpm,
        phLevel,
        temperatureC,
      ];
}

// ================================================================
// Reading
// ================================================================

class ReadingEntity extends Equatable {
  final int id;

  final int? taskId;
  final int? technicianId;
  final String? technicianName;

  final double? chlorinePpm;
  final double? phLevel;
  final double? temperatureC;

  final String? notes;
  final String? recordedAt;

  const ReadingEntity({
    required this.id,
    this.taskId,
    this.technicianId,
    this.technicianName,
    this.chlorinePpm,
    this.phLevel,
    this.temperatureC,
    this.notes,
    this.recordedAt,
  });

  @override
  List<Object?> get props => [
        id,
        taskId,
        technicianId,
        technicianName,
        chlorinePpm,
        phLevel,
        temperatureC,
        notes,
        recordedAt,
      ];
}