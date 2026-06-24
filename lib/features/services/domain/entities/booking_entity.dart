class BookingEntity {
  final int id;
  final String userName;
  final int userId;
  final String userRole;
  final String date;
  final String time;
  final String status;
  final String bookingType;
  final String? serviceName;
  final int? serviceId;
  final List<String> techniciansNames;
  final List<int> techniciansIds;

  BookingEntity({
    this.serviceId,
    required this.id,
    required this.userName,
    required this.userRole,
    required this.date,
    required this.time,
    required this.status,
    required this.bookingType,
    this.serviceName,
    required this.techniciansNames,
    required this.techniciansIds,
    required this.userId,
  });
}
