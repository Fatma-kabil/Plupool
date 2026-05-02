import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/router/app_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/features/BottomNavBar/presentation/manager/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_state.dart';
import 'package:plupool/features/auth/presentation/manager/otp_cubit/otp_cubit.dart';
import 'package:plupool/features/home/presentaation/manager/drawer_cubit/drawer_cubit.dart';
import 'package:plupool/features/offers/presentation/manager/cubits/offer_cubit/offer_cubit.dart';
import 'package:plupool/features/offers/presentation/manager/cubits/product_offer_cubit/product_offer_cubit.dart';
import 'package:plupool/features/orders/presentation/manager/order_cubit.dart/order_cubit.dart';
import 'package:plupool/features/packages/presentation/manager/package_cubit/package_cubit.dart';
import 'package:plupool/features/products/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:plupool/features/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:plupool/features/select_role/presentation/views/manager/select_role_cubit/select_role_cubit.dart';
import 'package:plupool/features/services/presentation/manager/booking_cubit/booking_cubit.dart';
import 'package:plupool/features/services/presentation/manager/requested_cubit/requedted_cubit.dart';
import 'package:plupool/features/settening/presentation/manager/cubits/faq_cubit/faq_cubit.dart';
import 'package:plupool/features/store/presentation/cubits/category_cubit/category_cubit.dart';
import 'package:plupool/features/support/presentation/manager/cubits/message_cubit/contact_cubit.dart';

class PlupoolApp extends StatelessWidget {
  const PlupoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavCubit()),
        BlocProvider(create: (_) => sl<SelectRoleCubit>()),
        BlocProvider(create: (_) => sl<OtpCubit>()),
        BlocProvider(create: (_) => sl<AuthCubit>()),
        BlocProvider(create: (_) => sl<UserCubit>()),
        BlocProvider(create: (_) => DrawerCubit()),
        BlocProvider(create: (_) => sl<ProductCubit>()),
        BlocProvider(create: (_) => sl<ProductOfferCubit>()),
        BlocProvider(create: (_) => sl<CategoryCubit>()..getCategories()),
        BlocProvider(create: (_) => sl<OfferCubit>()..fetchOffers()),
        BlocProvider(create: (_) => sl<FaqCubit>()),
        BlocProvider(create:  (_) => sl<BookingCubit>()..getBookings(),),
        BlocProvider(create:  (_) => sl<ContactCubit>()..getMessages(),),
        BlocProvider(create: (_) => sl<RequestsCubit>()..getTabCounts(),),
        BlocProvider(create: (_) => sl<OrdersCubit>()),
        BlocProvider(create: (_) => sl<PackagesCubit>()..getPackages(),),
      ],
      child: BlocListener<AuthCubit, AuthState>(
        listenWhen: (prev, curr) => prev.token != curr.token,
        listener: (context, state) {
          final token = state.token;
          if (token != null && token.isNotEmpty) {
            context.read<UserCubit>().fetchCurrentUser(token);
          }
        },
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true, // ✅ مهم جدًا
          //   locale: DevicePreview.locale(context), // ✅
          //   builder: DevicePreview.appBuilder,
          // ✅ فعلّي العربي
          locale: const Locale('ar'),
          supportedLocales: const [Locale('ar'), Locale('en')],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          routerConfig: appRouter,
          theme: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            fontFamily: 'Cairo',
            scaffoldBackgroundColor: AppColors.kScaffoldColor,
          ),
        ),
      ),
    );
  }
}
