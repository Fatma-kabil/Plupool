class VisitEntity {
  final int bookingId;
  final String bookingDate;
  final String bookingTime;
  final String status;
  final String? adminNotes;

  const VisitEntity({
    required this.bookingId,
    required this.bookingDate,
    required this.bookingTime,
    required this.status,
    required this.adminNotes,
  });
}