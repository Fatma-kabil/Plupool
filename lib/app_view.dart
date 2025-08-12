import 'package:flutter/material.dart';
import 'package:plupool/features/splash/presentation/views/splash_view.dart';

// ignore: camel_case_types
class plupoolApp extends StatelessWidget {
  const plupoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,home: SplashView(),);
  }
}
