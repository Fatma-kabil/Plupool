import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:plupool/core/app_router.dart';

// ignore: camel_case_types
class plupoolApp extends StatelessWidget {
  const plupoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
       locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme:  ThemeData(
    fontFamily: 'Cairo',
  ),
      debugShowCheckedModeBanner: false,
       routerConfig: appRouter,
      );
  }
}
