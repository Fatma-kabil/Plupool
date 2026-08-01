import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/features/notifications/data/models/device_registration_model.dart';

abstract class NotificationRemoteDataSource {
  Future<DeviceRegistrationModel> registerDevice({
    required String token,
    required String platform,
    required String deviceId,
  });
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final ApiService apiService;

  NotificationRemoteDataSourceImpl(this.apiService);

  @override
  Future<DeviceRegistrationModel> registerDevice({
    required String token,
    required String platform,
    required String deviceId,
  }) async {
    final response = await apiService.post(
      '/notifications/devices',
      data: {"token": token, "platform": platform, "device_id": deviceId},
    );

    print("========== REGISTER DEVICE ==========");
    print(response.statusCode);
    print(response.data);
    print("====================================");

    return DeviceRegistrationModel.fromJson(response.data);
  }
}
