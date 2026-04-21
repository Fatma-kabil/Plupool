class BookingEntity {
  final int id;
  final String userName;
  final String userRole;
  final String date;
  final String time;
  final String status;
  final String bookingType;
  final String? serviceName;
  final List<String> technicians;

  BookingEntity({
    
    required this.id,
    required this.userName,
    required this.userRole,
    required this.date,
    required this.time,
    required this.status,
    required this.bookingType,
    this.serviceName,
    required this.technicians,
  });
}