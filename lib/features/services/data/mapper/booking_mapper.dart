import 'package:plupool/features/services/data/models/booking_model.dart';
import 'package:plupool/features/services/data/models/booking_response_model.dart';
import 'package:plupool/features/services/data/models/booking_statistics_model.dart';
import 'package:plupool/features/services/domain/entities/booking_entity.dart';
import 'package:plupool/features/services/domain/entities/booking_list_entity.dart';
import 'package:plupool/features/services/domain/entities/booking_statistics_entity.dart';

extension BookingMapper on BookingModel {
  BookingEntity toEntity() {
    return BookingEntity(
      id: id,
      userName: userName,
      date: bookingDate,
      time: bookingTime,
      status: status,
      bookingType: bookingType,
      serviceName: serviceName,
      technicians: technicianNames,
    );
  }
}

extension StatisticsMapper on BookingStatisticsModel {
  BookingStatisticsEntity toEntity() {
    return BookingStatisticsEntity(
      pending: pending,
      confirmed: confirmed,
      inProgress: inProgress,
      completed: completed,
      cancelled: cancelled,
      rejected: rejected,
    );
  }
}

extension ResponseMapper on BookingResponseModel {
  BookingListEntity toEntity() {
    return BookingListEntity(
      total: total,
      statistics: statistics.toEntity(),
      bookings: bookings.map((e) => e.toEntity()).toList(),
    );
  }
}