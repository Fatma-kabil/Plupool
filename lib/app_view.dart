import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/router/app_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:device_preview/device_preview.dart';
import 'package:plupool/features/BottomNavBar/presentation/manager/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:plupool/features/auth/presentation/manager/otp_cubit/otp_cubit.dart';

import 'package:plupool/features/select_role/presentation/views/manager/select_role_cubit/select_role_cubit.dart';

class PlupoolApp extends StatelessWidget {
  const PlupoolApp({super.key});
   final storage = const FlutterSecureStorage();


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavCubit()),
         BlocProvider(create: (_) => sl<SelectRoleCubit>()),
           BlocProvider(create: (_) => sl<OtpCubit>()),
            BlocProvider(
          create: (_) => AuthCubit(storage),
        ),
     //     BlocProvider(create:     (_) => sl<SignUpCubit>()),
      
      
      

      ],
      child: Builder(
        builder: (context) {
          SizeConfig.init(context);
          return MaterialApp.router(
            useInheritedMediaQuery: true, // ✅ مهم جدًا
        //   locale: DevicePreview.locale(context), // ✅
         //   builder: DevicePreview.appBuilder, // ✅
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
