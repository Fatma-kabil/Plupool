import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/app_view.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:plupool/core/services/notification_service.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(
  RemoteMessage message,
) async {
  await Firebase.initializeApp();

  debugPrint(
    '=========================================',
  );

  debugPrint(
    '🔥 BACKGROUND NOTIFICATION RECEIVED',
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
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ==========================================================
  // FIREBASE
  // ==========================================================

  await Firebase.initializeApp();

  // ==========================================================
  // BACKGROUND FCM
  // ==========================================================

  FirebaseMessaging.onBackgroundMessage(
    firebaseMessagingBackgroundHandler,
  );

  // ==========================================================
  // NOTIFICATION SERVICE
  // ==========================================================

  await NotificationService.instance.initialize();

  // ==========================================================
  // SERVICE LOCATOR
  // ==========================================================

  await initServiceLocator();

  // ==========================================================
  // DATE FORMATTING
  // ==========================================================

  await initializeDateFormatting(
    'ar',
    null,
  );

  // ==========================================================
  // RUN APP
  // ==========================================================

  runApp(
    const PlupoolApp(),
  );

  FlutterNativeSplash.remove();
}

//python -m uvicorn app.main:app --reload
// python -m uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload