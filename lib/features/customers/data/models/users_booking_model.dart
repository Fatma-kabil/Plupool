class UsersBookingModel {
  final int id;
  final String bookingType;
  final String status;
  final String bookingDate;
  final String bookingTime;
  final String serviceName;
  final DateTime createdAt;

  UsersBookingModel({
    required this.id,
    required this.bookingType,
    required this.status,
    required this.bookingDate,
    required this.bookingTime,
    required this.serviceName,
    required this.createdAt,
  });

  factory UsersBookingModel.fromJson(Map<String, dynamic> json) {
    return UsersBookingModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      bookingType: json['booking_type'] ?? '',
      status: json['status'] ?? '',
      bookingDate: json['booking_date'] ?? '',
      bookingTime: json['booking_time'] ?? '',
      serviceName: json['service_name'] ?? '',
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ??
          DateTime.now(),
    );
  }
}