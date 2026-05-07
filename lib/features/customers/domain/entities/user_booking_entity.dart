class UserBookingEntity {
  final int id;
  final String bookingType;
  final String status;
  final String bookingDate;
  final String bookingTime;
  final String serviceName;
  final DateTime createdAt;

  const UserBookingEntity({
    required this.id,
    required this.bookingType,
    required this.status,
    required this.bookingDate,
    required this.bookingTime,
    required this.serviceName,
    required this.createdAt,
  });
}