import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_loading_indecator.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_state.dart';
import 'package:plupool/features/home/presentaation/views/guest_widgets/guest_appbar.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/tech_appbar.dart';
import 'package:plupool/features/home/presentaation/views/widgets/offer_section.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/tech_info_card_row.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/weekly_request_test.dart';
import 'package:plupool/features/home/presentaation/views/widgets/projects_section.dart';
import 'package:plupool/features/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:plupool/features/profile/presentation/manager/user_cubit/user_state.dart';
import 'package:plupool/features/select_role/presentation/views/manager/select_role_cubit/select_role_cubit.dart';

import 'package:go_router/go_router.dart';
class TechHomeView extends StatefulWidget {
  const TechHomeView({super.key});

  @override
  State<TechHomeView> createState() => _TechHomeViewState();
}

class _TechHomeViewState extends State<TechHomeView> {
  bool _isFetchingUser = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isFetchingUser) {
      final authCubit = context.read<AuthCubit>();
      final token = authCubit.state.token;
      if (token != null && token.isNotEmpty) {
        context.read<UserCubit>().fetchCurrentUser(token);
        context.read<SelectRoleCubit>().getSavedRole();
        _isFetchingUser = true;
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
                        left: SizeConfig.w(17),
                        right: SizeConfig.w(17),
                      ),
                      child: ListView(
                        children: [
                          if (authState.status == AuthStatus.guest)
                            GuestAppbar(role: roleState.roleName),
                          if (authState.status == AuthStatus.loggedIn)
                            TechAppbar(
                              model: user,
                            ),
                          const SizedBox(height: 30),
                          const TechInfoCardRow(),
                          const SizedBox(height: 30),
                          authState.status == AuthStatus.guest
                              ? const SizedBox()
                              : Column(
                                  children: [
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        Text(
                                          "مهام الأسبوع",
                                          style: AppTextStyles.styleBold20(
                                            context,
                                          ).copyWith(color: Colors.black),
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            context.push('/weeklytasksview');
                                          },
                                          child: Text(
                                            "عرض المزيد",
                                            style:
                                                AppTextStyles.styleSemiBold16(
                                                  context,
                                                ).copyWith(
                                                  color:
                                                      AppColors.kprimarycolor,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    const WeeklyRequestsList(),
                                  ],
                                ),
                          const SizedBox(height: 30),
                          OfferSection(
                            offers: equipmentOffers,
                            role: roleState.roleName,
                          ),
                          const SizedBox(height: 30),
                          const ProjectsSection(),
                          const SizedBox(height: 30),
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
