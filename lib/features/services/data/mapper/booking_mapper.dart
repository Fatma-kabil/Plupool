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
      userRole: userRole,
      serviceId: serviceId,
    );
  }
}

extension StatisticsMapper on BookingStatisticsModel {
  BookingStatisticsEntity toEntity() {
    return BookingStatisticsEntity(
      urgent: urgent,
      scheduled: scheduled,
      inProgress: inProgress,
      completed: completed,
    
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
extension BookingEntityMapper on BookingEntity {
  BookingModel toModel() {
    return BookingModel(
      bookingType: bookingType,
      bookingDate: date,
      bookingTime: time,
      notes: null,

      id: id,
      userId: 0, // لو مش موجود في الـ entity خليه default أو خديه من مكان تاني
      serviceId: serviceId,
      poolTypeId: 0,
      packageId: null,

      customLength: null,
      customWidth: null,
      customDepth: null,

      status: status,
      adminNotes: null,
      nextMaintenanceDate: null,
      reminderSent: false,

      createdAt: "",
      updatedAt: null,

      serviceName: serviceName,
      poolTypeName: "",
      packageName: null,
      userName: userName,
      userRole: userRole,

      technicianIds: [],
      technicianNames: technicians,
      techniciansDisplay: technicians.join(" - "),

      canBeRated: false,
      isRated: false,
    );
  }
}