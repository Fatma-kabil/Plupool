import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/services/data/models/booking_model.dart';
import 'package:plupool/features/services/data/models/booking_response_model.dart';

class BookingRemoteDataSource   {
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

  final res = await api.get(
    Endpoints.servicesBookings,
    queryParams: params,
  );

  return BookingResponseModel.fromJson(res.data);
}
 
  Future<BookingModel> getBookingDetails(int id) async {
    final res =
        await api.get('${Endpoints.servicesBookings}/$id');

    return BookingModel.fromJson(res.data);
  }

  
  Future<BookingModel> updateBooking({
    required int id,
    String? status,
    String? notes,
    String? nextDate,
    List<int>? technicianIds,
  }) async {
    final res = await api.put(
      '${Endpoints.servicesBookings}/$id',
      data: {
        "status": status,
        "admin_notes": notes,
        "next_maintenance_date": nextDate,
        "technician_ids": technicianIds,
      },
    );

    return BookingModel.fromJson(res.data);
  }


  Future<void> deleteBooking(int id) async {
    await api.delete('${Endpoints.servicesBookings}/$id');
  }
}