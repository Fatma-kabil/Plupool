import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:plupool/core/app_router.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// ignore: camel_case_types
class PlupoolApp extends StatelessWidget {
  const PlupoolApp({super.key});

  @override
  Widget build(BuildContext context) {
      SizeConfig.init(context);
    return MaterialApp.router(
      locale: DevicePreview.locale(context) ?? const Locale('ar'),
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        fontFamily: 'Cairo',
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
