import 'package:plupool/features/services/domain/entities/booking_entity.dart';
import 'package:plupool/features/services/domain/entities/booking_statistics_entity.dart';

class BookingListEntity {
  final int total;
  final BookingStatisticsEntity statistics;
  final List<BookingEntity> bookings;

  BookingListEntity({
    required this.total,
    required this.statistics,
    required this.bookings,
  });
}