import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/visits/data/models/booking_visits_model.dart';

abstract class BookingVisitsRemoteDataSource {
  Future<BookingVisitsModel> getBookingVisits({
    required int bookingId,
  });
}

class BookingVisitsRemoteDataSourceImpl
    implements BookingVisitsRemoteDataSource {
  final ApiService api;

  BookingVisitsRemoteDataSourceImpl({
    required this.api,
  });

  @override
  Future<BookingVisitsModel> getBookingVisits({
    required int bookingId,
  }) async {
    
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');
    final response = await api.get(
      '${Endpoints.servicesBookings}/$bookingId/visits',
       options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return BookingVisitsModel.fromJson(
      response.data,
    );
  }
}