import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_state.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/tech_task_view_body.dart';
import 'dart:ui'; // ضروري للـ ImageFilter

class TechTaskView extends StatelessWidget {
  const TechTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthCubit>().checkAuth();

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(17),
          vertical: SizeConfig.h(18),
        ),
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, authState) {
            return Stack(
              children: [
                TechTaskViewBody(),

                if (authState.status == AuthStatus.guest)
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                      child: Container(
                        color: Colors.black.withOpacity(0), // ضروري عشان يشتغل البلور
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
