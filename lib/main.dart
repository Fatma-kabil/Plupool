import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:plupool/app_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:plupool/core/di/service_locator.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initServiceLocator(); // ✅ مهم جدًا قبل runApp
  runApp(
//  DevicePreview(
  //    enabled: !kReleaseMode, // ✅ يشتغل فقط في debug
    //  builder: (context) => 
     const PlupoolApp(),
     
  // ),
  );

  // تشيل السبلاتش بعد ما الاب يفتح
  FlutterNativeSplash.remove();
}


