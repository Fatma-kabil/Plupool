import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_loading_indecator.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_state.dart';
import 'package:plupool/features/home/data/models/app_bar_model.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/customer_appbar.dart';
import 'package:plupool/features/home/presentaation/views/guest_widgets/guest_appbar.dart';
import 'package:plupool/features/home/presentaation/views/widgets/offer_section.dart';
import 'package:plupool/features/home/presentaation/views/widgets/projects_section.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/promo_carousel.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/reviews_section.dart';
import 'package:plupool/features/select_role/presentation/views/manager/select_role_cubit/select_role_cubit.dart';


class CustomerHomeView extends StatelessWidget {
  const CustomerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔹 التحقق من التوكن عند الدخول على الصفحة
    context.read<AuthCubit>().checkAuth();
    context.read<SelectRoleCubit>().getSavedRole();

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, authState) {
        return BlocBuilder<SelectRoleCubit, SelectRoleState>(
          builder: (context, roleState) {
            if (roleState is GetRoleSuccess) {
              return Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.h(12),
                  left: SizeConfig.w(15),
                  right: SizeConfig.w(15),
                ),
                child: ListView(
                  children: [
                    if (authState.status == AuthStatus.loggedIn)
                      CustomerAppbar(
                        model: AppbarModel(
                          avatarUrl: 'assets/images/user1.png',
                          username: 'احمد محمد',
                          subtitle: 'صاحب حمام سباحه',
                        ),
                      ),
                    if (authState.status == AuthStatus.guest)
                      GuestAppbar(role: roleState.roleName),

                    const SizedBox(height: 35),
                    const PromoCarousel(),
                    const SizedBox(height: 29),
                    OfferSection(offers: offers,role: roleState.roleName,),
                    const SizedBox(height: 27),
                    const ProjectsSection(),
                    const SizedBox(height: 42),
                    const ReviewSection(),
                  ],
                ),
              );
            }

            return const Center(child: CustomLoadingIndecator());
          },
        );
      },
    );
  }
}
