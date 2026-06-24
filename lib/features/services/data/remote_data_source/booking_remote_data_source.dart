import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/services/data/models/booking_model.dart';
import 'package:plupool/features/services/data/models/booking_response_model.dart';
import 'package:plupool/features/services/data/models/booking_user_model.dart';
import 'package:plupool/features/services/domain/params/get_user_booking_params.dart';

class BookingRemoteDataSource {
  final ApiService api;

  BookingRemoteDataSource(this.api);

  Future<BookingResponseModel> getBookings({
    String? status,
    String? type,
    String? search,
  }) async {
    final params = {
      'status_filter': status,
      'booking_type': type,
      'search': search,
      'skip': 0,
      'limit': 50,
    };

    /// 🔥 أهم خطوة
    params.removeWhere((key, value) => value == null);

    final res = await api.get(Endpoints.servicesBookings, queryParams: params);

    return BookingResponseModel.fromJson(res.data);
  }

  Future<BookingModel> getBookingDetails(int id) async {
    final res = await api.get('${Endpoints.servicesBookings}/$id');

    return BookingModel.fromJson(res.data);
  }

 Future<BookingModel> updateBooking({
  required int id,
  required BookingModel booking,
}) async {

  final body = booking.toJson();

  print("============== UPDATE BODY ==============");
  print(body);

  final res = await api.put(
    '${Endpoints.servicesBookings}/$id',
    data: body,
  );

  print("============== RESPONSE ==============");
  print(res.data);

  return BookingModel.fromJson(res.data);
}

  Future<void> deleteBooking(int id) async {
    await api.delete('${Endpoints.servicesBookings}/$id');
  }

  Future<List<BookingUserModel>> getUserBookings(
    GetUserBookingsParams params,
  ) async {
    final response = await api.get(
      '${Endpoints.users}/${params.userId}/bookings',
      queryParams: {
        if (params.status != null) 'status': params.status,

        if (params.bookingType != null) 'booking_type': params.bookingType,

        'page': params.page,
        'page_size': params.pageSize,
      },
    );

    final List bookings = response.data['bookings'];

    return bookings.map((e) => BookingUserModel.fromJson(e)).toList();
  }
}
