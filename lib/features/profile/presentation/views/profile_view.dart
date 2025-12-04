import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/home/presentaation/views/guest_widgets/error_card.dart';
import 'package:plupool/features/profile/presentation/views/widgets/profile_view_body.dart';
import 'dart:ui'; // ضروري للـ ImageFilter
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_state.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(17),
            vertical: SizeConfig.h(25),
          ),
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, authState) {
              return Stack(
                children: [
                  const ProfileViewBody(),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: SizeConfig.h(10),
                    child: CustomTextBtn(
                      text: 'حذف الحساب',
                      onPressed: () {
                        context.push('/deleteaccountview');
                      },
                      color: Color(0xffE63946),
                    ),
                  ),

                  if (authState.status == AuthStatus.guest)
                    Positioned.fill(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: Container(
                          color: Colors.black.withOpacity(
                            0,
                          ), // مهم عشان البلور يشتغل
                        ),
                      ),
                    ),
                  if (authState.status == AuthStatus.guest)
                    Center(
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
    );
  }
}
