
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/consruction_service/data/models/construction_booking_model.dart';

class ConstructionRemoteDataSource {
  final ApiService apiService;
  ConstructionRemoteDataSource(this.apiService);
  Future<void> bookConstruction(ConstructionBookingModel model) async {
    await apiService.post(
      '${Endpoints.baseUrl}/pool-owner/services',
      data: model.toJson(),
       
    );
  }
}
