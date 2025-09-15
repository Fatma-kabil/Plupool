import 'package:flutter/material.dart';

import 'package:plupool/core/app_router.dart';
import 'package:plupool/core/utils/size_config.dart';

// ...existing imports...

class PlupoolApp extends StatelessWidget {
  const PlupoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
     
    );
  }
}