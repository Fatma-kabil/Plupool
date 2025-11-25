import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_loading_indecator.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_state.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/customer_appbar.dart';
import 'package:plupool/features/home/presentaation/views/guest_widgets/guest_appbar.dart';
import 'package:plupool/features/home/presentaation/views/widgets/offer_section.dart';
import 'package:plupool/features/home/presentaation/views/widgets/projects_section.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/promo_carousel.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/reviews_section.dart';
import 'package:plupool/features/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:plupool/features/profile/presentation/manager/user_cubit/user_state.dart';
import 'package:plupool/features/select_role/presentation/views/manager/select_role_cubit/select_role_cubit.dart';

class CustomerHomeView extends StatefulWidget {
  const CustomerHomeView({super.key});

  @override
  State<CustomerHomeView> createState() => _CustomerHomeViewState();
}

class _CustomerHomeViewState extends State<CustomerHomeView> {
  bool _hasFetchedUser = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_hasFetchedUser) {
      final authCubit = context.read<AuthCubit>();
      final token = authCubit.state.token;
      if (token != null && token.isNotEmpty) {
        context.read<UserCubit>().fetchCurrentUser(token);
        context.read<SelectRoleCubit>().getSavedRole();
        _hasFetchedUser = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, authState) {
        return BlocBuilder<SelectRoleCubit, SelectRoleState>(
          builder: (context, roleState) {
            if (roleState is GetRoleSuccess) {
              return BlocBuilder<UserCubit, UserState>(
                builder: (context, userState) {
                  if (userState is UserLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (userState is UserError) {
                    return Center(child: Text('حدث خطأ: ${userState.message}'));
                  } else if (userState is UserLoaded) {
                    final user = userState.user;

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
                              model: user,
                            ),
                          if (authState.status == AuthStatus.guest)
                            GuestAppbar(role: roleState.roleName),

                          const SizedBox(height: 35),
                          const PromoCarousel(),
                          const SizedBox(height: 29),
                          OfferSection(
                            offers: offers,
                            role: roleState.roleName,
                          ),
                          const SizedBox(height: 27),
                          const ProjectsSection(),
                          const SizedBox(height: 42),
                          const ReviewSection(),
                        ],
                      ),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              );
            }
            return const Center(child: CustomLoadingIndecator());
          },
        );
      },
    );
  }
}
