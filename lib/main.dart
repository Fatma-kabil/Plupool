import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:plupool/app_view.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

 

  runApp(const PlupoolApp());

  // تشيل السبلاتش بعد ما الاب يفتح
  FlutterNativeSplash.remove();
}
