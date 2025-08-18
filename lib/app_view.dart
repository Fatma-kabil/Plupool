import 'package:flutter/material.dart';
import 'package:plupool/core/app_router.dart';
import 'package:plupool/core/utils/size_config.dart';

class PlupoolApp extends StatelessWidget {
  const PlupoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            // هنا خلاص MediaQuery جاهزة
            SizeConfig.init(context);

            return MaterialApp.router(
            
              theme: ThemeData(
                fontFamily: 'Cairo',
              ),
              debugShowCheckedModeBanner: false,
              routerConfig: appRouter,
            );
          },
        );
      },
    );
  }
}
