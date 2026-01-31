
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/app_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initServiceLocator(); 
   await initializeDateFormatting('ar'); // ✅ تهيئة اللغة العربية// ✅ مهم جدًا قبل runApp
 
   // ✅ لو عايز تمسح التوكن (للتجربة أو reset)
  const storage = FlutterSecureStorage();
  await storage.delete(key: 'token');
 
 
  runApp(
     DevicePreview(
    enabled: !kReleaseMode, // ✅ يشتغل فقط في debug
     builder: (context) 
    => 
     const PlupoolApp(),
     
),
  );

  // تشيل السبلاتش بعد ما الاب يفتح
  FlutterNativeSplash.remove();
}



//python -m uvicorn app.main:app --reload
// python -m uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload