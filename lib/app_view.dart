import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/router/app_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:device_preview/device_preview.dart';
import 'package:plupool/features/BottomNavBar/presentation/manager/bottom_nav_cubit/bottom_nav_cubit.dart';

class PlupoolApp extends StatelessWidget {
  const PlupoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => BottomNavCubit())],
      child: Builder(
        builder: (context) {
          SizeConfig.init(context);
          return MaterialApp.router(
           useInheritedMediaQuery: true, // ✅ مهم جدًا
            locale: DevicePreview.locale(context), // ✅
            builder: DevicePreview.appBuilder, // ✅
            debugShowCheckedModeBanner: false,
            routerConfig: appRouter,
            theme: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              fontFamily: 'Cairo',
              scaffoldBackgroundColor: AppColors.kScaffoldColor,
            ),
          );
        },
      ),
    );
  }
}
