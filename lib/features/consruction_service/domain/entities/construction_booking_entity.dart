class ConstructionBookingEntity {
  final String bookingType;
  final String bookingDate;
  final String bookingTime;
  final int poolTypeId;
  final double? customLength;
  final double? customWidth;
  final double? customDepth;
  final String? notes;

  ConstructionBookingEntity({
    required this.bookingType,
    required this.bookingDate,
    required this.bookingTime,
    required this.poolTypeId,
    this.customLength,
    this.customWidth,
    this.customDepth,
    this.notes,
  });
}