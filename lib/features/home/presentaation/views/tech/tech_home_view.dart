import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_loading_indecator.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:plupool/features/home/presentaation/views/guest_widgets/guest_appbar.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/tech_appbar.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/tech_info_card_row.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/weekly_request_test.dart';
import 'package:plupool/features/home/presentaation/views/widgets/offer_section.dart';
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

    if (_isFetchingUser) return;

    final token = context.read<AuthCubit>().state.token;

    context.read<SelectRoleCubit>().getSavedRole();

    if (token != null && token.isNotEmpty) {
      context.read<UserCubit>().fetchCurrentUser(token);
    }

    _isFetchingUser = true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectRoleCubit, SelectRoleState>(
      builder: (context, roleState) {
        if (roleState is! GetRoleSuccess) {
          return const Center(child: CustomLoadingIndecator());
        }

        final token = context.watch<AuthCubit>().state.token;

        // 🟡 Guest UI بدون UserCubit
        if (token == null || token.isEmpty) {
          return buildHomeLayout(
            appbar: GuestAppbar(role: roleState.roleName),
            showWeekly: false,
          );
        }

        // 🟢 LoggedIn → UserCubit
        return BlocBuilder<UserCubit, UserState>(
          builder: (context, userState) {
            if (userState is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (userState is UserError) {
              return Center(child: Text("خطأ: ${userState.message}"));
            }
            if (userState is UserLoaded) {
              return buildHomeLayout(
                appbar: TechAppbar(model: userState.user),
                showWeekly: true,
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }

  // ⬇️⬇️ UI مشتركة بين Guest / Logged
  Widget buildHomeLayout({
    required Widget appbar,
    required bool showWeekly,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.h(12),
        left: SizeConfig.w(17),
        right: SizeConfig.w(17),
      ),
      child: ListView(
        children: [
          appbar,
          const SizedBox(height: 30),
          const TechInfoCardRow(),
          const SizedBox(height: 30),

          if (showWeekly) ...[
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  "مهام الأسبوع",
                  style: AppTextStyles.styleBold20(context),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => context.push('/weeklytasksview'),
                  child: Text(
                    "عرض المزيد",
                    style: AppTextStyles.styleSemiBold16(context).copyWith(
                      color: AppColors.kprimarycolor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const WeeklyRequestsList(),
            const SizedBox(height: 30),
          ],

          OfferSection(offers: equipmentOffers, role: "فني"),
          const SizedBox(height: 30),
          const ProjectsSection(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
