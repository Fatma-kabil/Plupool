import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_loading_indecator.dart';

import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_state.dart';
import 'package:plupool/features/customers/presentation/manager/users_cubit/uers_cubit.dart';

import 'package:plupool/features/home/presentaation/views/customer/widgets/reviews_list.dart';
import 'package:plupool/features/home/presentaation/views/guest_widgets/guest_appbar.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/tech_appbar.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/tech_info_card_row.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/weekly_request_test.dart';
import 'package:plupool/features/home/presentaation/views/widgets/offer_section.dart';
import 'package:plupool/features/home/presentaation/views/widgets/projects_section.dart';
import 'package:plupool/features/offers/presentation/manager/cubits/product_offer_cubit/product_offer_cubit.dart';

import 'package:plupool/features/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:plupool/features/profile/presentation/manager/user_cubit/user_state.dart';
import 'package:plupool/features/projects/presentation/manager/project_cubit/project_cubit.dart';
import 'package:plupool/features/rating/presentation/manager/cubits/rating_cubit/ratings_cubit.dart';

import 'package:plupool/features/select_role/presentation/views/manager/select_role_cubit/select_role_cubit.dart';
import 'package:plupool/features/tasks/presentation/views/manager/tasks_cubit/week_tasks_cubit.dart';

class TechHomeView extends StatefulWidget {
  const TechHomeView({super.key});

  @override
  State<TechHomeView> createState() => _TechHomeViewState();
}

class _TechHomeViewState extends State<TechHomeView> {
  String? _lastFetchedToken;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      context.read<SelectRoleCubit>().getSavedRole();

      _handleAuthState(context.read<AuthCubit>().state);
    });
  }

  void _handleAuthState(AuthState authState) {
    final token = authState.token;

    // ==========================
    // Guest
    // ==========================

    if (authState.status != AuthStatus.loggedIn ||
        token == null ||
        token.isEmpty) {
      // مهم جدًا:
      // نمسح بيانات المستخدم القديمة
      context.read<UserCubit>().clearUser();

      _lastFetchedToken = null;

      return;
    }

    // ==========================
    // Logged In
    // ==========================

    // منع طلب الـ API أكثر من مرة بنفس التوكن
    if (_lastFetchedToken == token) {
      return;
    }

    _lastFetchedToken = token;

    context.read<UserCubit>().fetchCurrentUser(token);
  }

  Future<void> _refreshHome({int? userId}) async {
    final futures = <Future<void>>[
      context.read<ProductOfferCubit>().getOffers(),
      context.read<OurProjectsCubit>().getProjects(),
      context.read<RatingsCubit>().getRatings(status: "approved"),
    ];

    if (userId != null) {
      futures.add(context.read<UsersCubit>().getUserDetails(userId));
      futures.add(context.read<WeekTasksCubit>().getWeekTasks());
    }

    await Future.wait(futures);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, authState) {
        _handleAuthState(authState);
      },
      child: BlocBuilder<SelectRoleCubit, SelectRoleState>(
        builder: (context, roleState) {
          if (roleState is! GetRoleSuccess) {
            return const Center(child: CustomLoadingIndecator());
          }

          return BlocBuilder<AuthCubit, AuthState>(
            builder: (context, authState) {
              // ==========================================
              // GUEST
              // ==========================================

              if (authState.status != AuthStatus.loggedIn ||
                  authState.token == null ||
                  authState.token!.isEmpty) {
                return buildHomeLayout(
                  appbar: GuestAppbar(role: roleState.roleName),
                  showWeekly: false,
                );
              }

              // ==========================================
              // LOGGED IN
              // ==========================================

              return BlocBuilder<UserCubit, UserState>(
                builder: (context, userState) {
                  if (userState is UserLoading) {
                    return const Center(child: CustomLoadingIndecator());
                  }

                  if (userState is UserError) {
                    return Center(child: Text("خطأ: ${userState.message}"));
                  }

                  if (userState is UserLoaded) {
                    final user = userState.user;

                    return buildHomeLayout(
                      appbar: TechAppbar(model: user),
                      userId: user.id,
                      showWeekly: true,
                    );
                  }

                  return const Center(child: CustomLoadingIndecator());
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget buildHomeLayout({
    required Widget appbar,
    required bool showWeekly,
    int? userId,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.h(12),
        left: SizeConfig.w(17),
        right: SizeConfig.w(17),
      ),
      child: RefreshIndicator(
       color: Colors.black54,
        backgroundColor: AppColors.kScaffoldColor,
        onRefresh: () => _refreshHome(userId: userId),
        child: ListView(
          children: [
            appbar,

            const SizedBox(height: 30),

            // ==========================================
            // Logged In فقط
            // ==========================================
            if (showWeekly && userId != null) ...[
              TechInfoCardRow(userId: userId),

              const SizedBox(height: 30),

              Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    "مهام الأسبوع",
                    style: AppTextStyles.styleBold20(
                      context,
                    ).copyWith(color: AppColors.ktextcolor),
                  ),

                  const Spacer(),

                  GestureDetector(
                    onTap: () {
                      context.push('/weeklytasksview');
                    },
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

            // ==========================================
            // Guest + Logged In
            // ==========================================
            const OfferSection(),

            const ProjectsSection(),

            const ReviewsList(),
          ],
        ),
      ),
    );
  }
}
