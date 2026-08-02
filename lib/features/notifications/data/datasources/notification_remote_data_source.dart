import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/notifications/data/models/device_registration_model.dart';
import 'package:plupool/features/notifications/data/models/notification_model.dart';
import 'package:plupool/features/notifications/data/models/send_notification_request_model.dart';
import 'package:plupool/features/notifications/data/models/send_notification_response_model.dart';
import 'package:plupool/features/notifications/data/models/unread_count_model.dart';

abstract class NotificationRemoteDataSource {
  Future<DeviceRegistrationModel> registerDevice({
    required String token,
    required String platform,
    required String deviceId,
  });
  Future<List<NotificationModel>> getNotifications({
    bool? unreadOnly,
    int skip = 0,
    int limit = 100,
  });
  Future<void> markNotificationAsRead({required int notificationId});
  Future<void> unregisterDevice({required int registrationId});
  Future<UnreadCountModel> getUnreadCount();
  Future<SendNotificationResponseModel> sendBroadcastNotification(
    SendNotificationRequestModel request,
  );
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
      '${Endpoints.baseUrl}/notifications/devices',
      data: {"token": token, "platform": platform, "device_id": deviceId},
    );

    print("========== REGISTER DEVICE ==========");
    print(response.statusCode);
    print(response.data);
    print("====================================");

    return DeviceRegistrationModel.fromJson(response.data);
  }

  @override
  Future<List<NotificationModel>> getNotifications({
    bool? unreadOnly,
    int skip = 0,
    int limit = 100,
  }) async {
    final response = await apiService.get(
      '${Endpoints.baseUrl}/notifications',
      queryParams: {
        if (unreadOnly != null) 'unread_only': unreadOnly,

        'skip': skip,
        'limit': limit,
      },
    );

    print("========== GET NOTIFICATIONS ==========");
    print(response.statusCode);
    print(response.data);
    print("=======================================");

    return (response.data as List)
        .map((e) => NotificationModel.fromJson(e))
        .toList();
  }

  @override
  Future<void> markNotificationAsRead({required int notificationId}) async {
    await apiService.patch(
      '${Endpoints.baseUrl}/notifications/$notificationId/read',
    );
  }

  @override
  Future<void> unregisterDevice({required int registrationId}) async {
    await apiService.delete(
      '${Endpoints.baseUrl}/notifications/devices/$registrationId',
    );
  }

  @override
  Future<UnreadCountModel> getUnreadCount() async {
    final response = await apiService.get(
      '${Endpoints.baseUrl}/notifications/unread-count',
    );

    return UnreadCountModel.fromJson(response.data);
  }

  @override
  Future<SendNotificationResponseModel> sendBroadcastNotification(
    SendNotificationRequestModel request,
  ) async {
    final response = await apiService.post(
      '${Endpoints.baseUrl}/admin/notifications/broadcast',
      data: request.toJson(),
    );

    print("========== SEND BROADCAST ==========");
    print(response.statusCode);
    print(response.data);
    print("===================================");

    return SendNotificationResponseModel.fromJson(response.data);
  }
}
