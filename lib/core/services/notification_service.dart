import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class NotificationService {
  NotificationService._();

  static final NotificationService instance = NotificationService._();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  StreamSubscription<RemoteMessage>? _foregroundSubscription;
  StreamSubscription<String>? _tokenRefreshSubscription;

  Future<void> initialize() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );

    debugPrint(
      'Notification Permission: ${settings.authorizationStatus}',
    );

    final token = await getFcmToken();
    debugPrint("FCM Token: $token");
  }

  Future<String?> getFcmToken() async {
    return _messaging.getToken();
  }

  Future<String> getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;

    return androidInfo.id;
  }

  String get platform {
    if (Platform.isAndroid) return "android";
    if (Platform.isIOS) return "ios";
    return "unknown";
  }

  /// ================= Foreground Notifications =================

  void startForegroundListener({
    required VoidCallback onNotificationReceived,
  }) {
    _foregroundSubscription?.cancel();

    _foregroundSubscription = FirebaseMessaging.onMessage.listen(
      (message) {
        debugPrint("========== Foreground Notification ==========");
        debugPrint("Title: ${message.notification?.title}");
        debugPrint("Body : ${message.notification?.body}");
        debugPrint("Data : ${message.data}");
        debugPrint("=============================================");

        onNotificationReceived();
      },
    );
  }

  Future<void> stopForegroundListener() async {
    await _foregroundSubscription?.cancel();
    _foregroundSubscription = null;
  }

  /// ================= Token Refresh =================

  void startTokenRefreshListener({
    required Future<void> Function(String token) onTokenRefresh,
  }) {
    _tokenRefreshSubscription?.cancel();

    _tokenRefreshSubscription = _messaging.onTokenRefresh.listen((token) async {
      debugPrint("New FCM Token: $token");
      await onTokenRefresh(token);
    });
  }

  Future<void> stopTokenRefreshListener() async {
    await _tokenRefreshSubscription?.cancel();
    _tokenRefreshSubscription = null;
  }
}