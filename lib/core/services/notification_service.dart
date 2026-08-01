import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class NotificationService {
  NotificationService._();

  static final NotificationService instance = NotificationService._();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    NotificationSettings settings = await _messaging.requestPermission(
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
    return await _messaging.getToken();
  }
  Future<String> getDeviceId() async {
  final deviceInfo = DeviceInfoPlugin();

  final androidInfo = await deviceInfo.androidInfo;

  return androidInfo.id; // أو androidInfo.serialNumber غير متاح في معظم الأجهزة
}

  Stream<String> get onTokenRefresh => _messaging.onTokenRefresh;

  String get platform {
    if (Platform.isAndroid) return "android";
    if (Platform.isIOS) return "ios";
    return "unknown";
  }
}