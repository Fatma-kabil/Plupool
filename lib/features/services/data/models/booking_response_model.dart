import 'package:plupool/features/services/data/models/booking_model.dart';
import 'package:plupool/features/services/data/models/booking_statistics_model.dart';

class BookingResponseModel {
  final int total;
  final BookingStatisticsModel statistics;
  final List<BookingModel> bookings;

  BookingResponseModel({
    required this.total,
    required this.statistics,
    required this.bookings,
  });

  factory BookingResponseModel.fromJson(Map<String, dynamic> json) {
    return BookingResponseModel(
      total: json['total'],
      statistics: BookingStatisticsModel.fromJson(json['statistics']),
      bookings: (json['bookings'] as List)
          .map((e) => BookingModel.fromJson(e))
          .toList(),
    );
  }
}