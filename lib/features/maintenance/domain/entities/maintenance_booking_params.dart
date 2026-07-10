class MaintenanceBookingEntity {
  final String bookingType;
  final String bookingDate;
  final String bookingTime;
  final int? serviceId;
   final int? packageId;

  const MaintenanceBookingEntity({
    required this.bookingType,
    required this.bookingDate,
    required this.bookingTime,
    this.serviceId,
   this.packageId
  });
}