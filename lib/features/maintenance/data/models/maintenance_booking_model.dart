import 'package:plupool/features/maintenance/domain/entities/maintenance_booking_params.dart';


class MaintenanceBookingModel extends MaintenanceBookingEntity {
  const MaintenanceBookingModel({
    required super.bookingType,
    required super.bookingDate,
    required super.bookingTime,
    super.serviceId,
  });

  Map<String, dynamic> toJson() {
    return {
      "booking_type": bookingType,
      "booking_date": bookingDate,
      "booking_time": bookingTime,
      if (serviceId != null) "service_id": serviceId,
    };
  }
}