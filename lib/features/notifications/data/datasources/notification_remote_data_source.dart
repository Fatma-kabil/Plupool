import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/notifications/data/models/device_registration_model.dart';
import 'package:plupool/features/notifications/data/models/notification_model.dart';
import 'package:plupool/features/notifications/data/models/send_notification_request_model.dart';
import 'package:plupool/features/notifications/data/models/send_notification_response_model.dart';
import 'package:plupool/features/notifications/data/models/send_user_notification_request_model.dart';
import 'package:plupool/features/notifications/data/models/send_user_notification_response_model.dart';
import 'package:plupool/features/notifications/data/models/unread_count_model.dart';

abstract class NotificationRemoteDataSource {
  Future registerDevice({
    required String token,
    required String platform,
    required String deviceId,
  });

  Future<List<NotificationModel>> getNotifications({
    bool? unreadOnly,
    int skip = 0,
    int limit = 100,
  });

  Future markNotificationAsRead({required int notificationId});
  Future unregisterDevice({required int registrationId});
  Future getUnreadCount();

  Future sendBroadcastNotification(
    SendNotificationRequestModel request,
  );
  Future sendNotificationToUser(
  SendUserNotificationRequestModel request,
);
}

class NotificationRemoteDataSourceImpl
    implements NotificationRemoteDataSource {
  final ApiService apiService;

  NotificationRemoteDataSourceImpl(this.apiService);

  @override
  Future registerDevice({
    required String token,
    required String platform,
    required String deviceId,
  }) async {
    final storage = sl<FlutterSecureStorage>();
    final authToken = await storage.read(key: 'token');

    final response = await apiService.post(
      '${Endpoints.baseUrl}/notifications/devices',
      data: {
        "token": token,
        "platform": platform,
        "device_id": deviceId,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $authToken',
        },
      ),
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
    final storage = sl<FlutterSecureStorage>();
    final authToken = await storage.read(key: 'token');

    final response = await apiService.get(
      '${Endpoints.baseUrl}/notifications',
      queryParams: {
        if (unreadOnly != null) 'unread_only': unreadOnly,
        'skip': skip,
        'limit': limit,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $authToken',
        },
      ),
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
  Future markNotificationAsRead({
    required int notificationId,
  }) async {
    final storage = sl<FlutterSecureStorage>();
    final authToken = await storage.read(key: 'token');

    await apiService.patch(
      '${Endpoints.baseUrl}/notifications/$notificationId/read',
      options: Options(
        headers: {
          'Authorization': 'Bearer $authToken',
        },
      ),
    );
  }

  @override
  Future unregisterDevice({
    required int registrationId,
  }) async {
    final storage = sl<FlutterSecureStorage>();
    final authToken = await storage.read(key: 'token');

    await apiService.delete(
      '${Endpoints.baseUrl}/notifications/devices/$registrationId',
      options: Options(
        headers: {
          'Authorization': 'Bearer $authToken',
        },
      ),
    );
  }

  @override
  Future getUnreadCount() async {
    final storage = sl<FlutterSecureStorage>();
    final authToken = await storage.read(key: 'token');

    final response = await apiService.get(
      '${Endpoints.baseUrl}/notifications/unread-count',
      options: Options(
        headers: {
          'Authorization': 'Bearer $authToken',
        },
      ),
    );

    return UnreadCountModel.fromJson(response.data);
  }

  @override
  Future sendBroadcastNotification(
    SendNotificationRequestModel request,
  ) async {
    final storage = sl<FlutterSecureStorage>();
    final authToken = await storage.read(key: 'token');

    final response = await apiService.post(
      '${Endpoints.baseUrl}/admin/notifications/broadcast',
      data: request.toJson(),
      options: Options(
        headers: {
          'Authorization': 'Bearer $authToken',
        },
      ),
    );

    print("========== SEND BROADCAST ==========");
    print(response.statusCode);
    print(response.data);
    print("===================================");

    return SendNotificationResponseModel.fromJson(response.data);
  }

  @override
Future sendNotificationToUser(
  SendUserNotificationRequestModel request,
) async {
  final storage = sl<FlutterSecureStorage>();
  final authToken = await storage.read(key: 'token');

  final response = await apiService.post(
    '${Endpoints.baseUrl}/admin/notifications/send',
    data: request.toJson(),
    options: Options(
      headers: {
        'Authorization': 'Bearer $authToken',
      },
    ),
  );

  print("========== SEND NOTIFICATION TO USER ==========");
  print(response.statusCode);
  print(response.data);
  print("===============================================");

  return SendUserNotificationResponseModel.fromJson(
    response.data,
  );
}
}