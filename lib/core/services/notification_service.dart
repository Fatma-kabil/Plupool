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

  // ============================================================
  // INITIALIZE
  // ============================================================

  Future<void> initialize() async {
    // Android 13+
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );

    debugPrint(
      '=========================================',
    );
    debugPrint(
      'Notification Permission: ${settings.authorizationStatus}',
    );
    debugPrint(
      '=========================================',
    );

    // مهم جدًا للتأكد إن الـ token موجود
    final token = await getFcmToken();

    debugPrint(
      '=========================================',
    );
    debugPrint('🔥 FCM TOKEN: $token');
    debugPrint(
      '=========================================',
    );

    // ==========================================================
    // IMPORTANT
    // ==========================================================

    // لما التطبيق يكون مفتوحًا، Firebase افتراضيًا
    // لا يعرض Notification في الـ status bar.
    //
    // لكن هنا إحنا فقط نستقبلها عن طريق onMessage.
    //
    // الـ background notification المفروض Android يعرضها
    // تلقائيًا لو السيرفر بيرسل notification payload.
  }

  // ============================================================
  // GET FCM TOKEN
  // ============================================================

  Future<String?> getFcmToken() async {
    try {
      final token = await _messaging.getToken();

      debugPrint('🔥 FCM TOKEN FROM getFcmToken: $token');

      return token;
    } catch (e) {
      debugPrint('❌ GET FCM TOKEN ERROR: $e');
      return null;
    }
  }

  // ============================================================
  // DEVICE ID
  // ============================================================

  Future<String> getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;

      return androidInfo.id;
    }

    if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;

      return iosInfo.identifierForVendor ?? 'unknown';
    }

    return 'unknown';
  }

  // ============================================================
  // PLATFORM
  // ============================================================

  String get platform {
    if (Platform.isAndroid) {
      return 'android';
    }

    if (Platform.isIOS) {
      return 'ios';
    }

    return 'unknown';
  }

  // ============================================================
  // FOREGROUND NOTIFICATIONS
  // ============================================================

  void startForegroundListener({
    required VoidCallback onNotificationReceived,
  }) {
    _foregroundSubscription?.cancel();

    _foregroundSubscription = FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        debugPrint(
          '=========================================',
        );

        debugPrint(
          '🔥 FOREGROUND NOTIFICATION RECEIVED',
        );

        debugPrint(
          'Title: ${message.notification?.title}',
        );

        debugPrint(
          'Body: ${message.notification?.body}',
        );

        debugPrint(
          'Data: ${message.data}',
        );

        debugPrint(
          'Message ID: ${message.messageId}',
        );

        debugPrint(
          '=========================================',
        );

        onNotificationReceived();
      },
      onError: (error) {
        debugPrint(
          '❌ FOREGROUND NOTIFICATION ERROR: $error',
        );
      },
    );
  }

  // ============================================================
  // STOP FOREGROUND
  // ============================================================

  Future<void> stopForegroundListener() async {
    await _foregroundSubscription?.cancel();

    _foregroundSubscription = null;
  }

  // ============================================================
  // TOKEN REFRESH
  // ============================================================

  void startTokenRefreshListener({
    required Future<void> Function(String token) onTokenRefresh,
  }) {
    _tokenRefreshSubscription?.cancel();

    _tokenRefreshSubscription =
        _messaging.onTokenRefresh.listen(
      (token) async {
        debugPrint(
          '=========================================',
        );

        debugPrint(
          '🔥 NEW FCM TOKEN',
        );

        debugPrint(token);

        debugPrint(
          '=========================================',
        );

        await onTokenRefresh(token);
      },
      onError: (error) {
        debugPrint(
          '❌ TOKEN REFRESH ERROR: $error',
        );
      },
    );
  }

  // ============================================================
  // STOP TOKEN REFRESH
  // ============================================================

  Future<void> stopTokenRefreshListener() async {
    await _tokenRefreshSubscription?.cancel();

    _tokenRefreshSubscription = null;
  }
}