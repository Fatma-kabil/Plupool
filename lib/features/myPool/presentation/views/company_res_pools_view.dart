import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_state.dart';
import 'package:plupool/features/home/presentaation/views/guest_widgets/error_card.dart';
import 'package:plupool/features/myPool/presentation/views/manager/company_clients_cubit/company_clients_cubit.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/company_res_pools_view_body.dart';

class CompanyResPoolsView extends StatelessWidget {
  const CompanyResPoolsView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return BlocProvider(
      create: (_) => sl<CompanyClientsCubit>()..getClients(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.w(17),
                right: SizeConfig.w(17),
                top: SizeConfig.h(25),
              ),
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, authState) {
                  return Stack(
                    children: [
                      // =========================
                      // المحتوى الأساسي
                      // =========================
                      const CompanyResPoolsViewBody(),

                      // =========================
                      // Blur للـ Guest
                      // =========================
                      if (authState.status == AuthStatus.guest)
                        Positioned.fill(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(
                              color: Colors.black.withOpacity(0),
                            ),
                          ),
                        ),

                      // =========================
                      // رسالة تسجيل الدخول
                      // =========================
                      if (authState.status == AuthStatus.guest)
                        const Center(
                          child: ErrorCard(
                            title: 'لم يتم تسجيل الدخول',
                            subtitle:
                                'لتستمتع بتجربتك وتتابع خدماتك، قم بتسجيل الدخول أولاً.',
                            color: Colors.white,
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
