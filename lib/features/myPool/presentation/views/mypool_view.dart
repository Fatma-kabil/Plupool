import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_state.dart';
import 'package:plupool/features/consruction_service/presentation/views/manager/user_notes_cubit/user_notes_cubit.dart';
import 'package:plupool/features/home/presentaation/views/guest_widgets/error_card.dart';
import 'package:plupool/features/myPool/presentation/views/manager/pool_info_cubit/pool_info_cubit.dart';
import 'package:plupool/features/myPool/presentation/views/manager/user_services_cubit/user_services_cubit.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/my_pool_view_body.dart';

class MyPoolView extends StatelessWidget {
  const MyPoolView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<PoolInfoCubit>(
          create: (_) => sl<PoolInfoCubit>()..getPoolInfo(),
        ),
        BlocProvider<UserNotesCubit>(
          create: (_) => sl<UserNotesCubit>()..getUserNotes(),
        ),
      ],
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SafeArea(
            child:
                // BlocBuilder<AuthCubit, AuthState>(
                //  builder: (context, authState) {
                //   return Stack(
                //    children: [
                const MyPoolViewBody(),

            //     if (authState.status == AuthStatus.guest)
            //      Positioned.fill(
            //       child: BackdropFilter(
            //         filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            //       child: Container(
            //        color: Colors.black.withOpacity(
            //          0,
            //      ), // مهم عشان البلور يشتغل
            //       ),
            //   ),
            //   ),
            //   if (authState.status == AuthStatus.guest)
            //   Center(
            //   child: ErrorCard(
            //   title: 'لم يتم تسجيل الدخول',
            // subtitle:
            //   'لتستمتع بتجربتك وتتابع خدماتك، قم بتسجيل الدخول أولاً.',
            //  color: Colors.white,
            //  ),
            //  ),
            // ],
            // );
            // },
            // ),
          ),
        ),
      ),
    );
  }
}
