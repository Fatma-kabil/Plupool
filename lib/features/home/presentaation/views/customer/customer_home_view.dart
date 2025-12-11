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
  @override
  void initState() {
    super.initState();

    /// نجيّب الدور من المخزن
    context.read<SelectRoleCubit>().getSavedRole();

    /// لو التوكن موجود بالفعل (مستخدم مسجل مسبقاً)
    final token = context.read<AuthCubit>().state.token;
    if (token != null && token.isNotEmpty) {
      context.read<UserCubit>().fetchCurrentUser(token);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (prev, curr) => prev.token != curr.token,
      listener: (context, state) {
        final token = state.token;

        /// كل ما يحصل تسجيل دخول → نجيب بيانات المستخدم
        if (token != null && token.isNotEmpty) {
          context.read<UserCubit>().fetchCurrentUser(token);
        }
      },
      child: BlocBuilder<SelectRoleCubit, SelectRoleState>(
        builder: (context, roleState) {
          if (roleState is! GetRoleSuccess) {
            return const Center(child: CustomLoadingIndecator());
          }

          final token = context.watch<AuthCubit>().state.token;

          // 🟡 Guest: بدون UserCubit
          if (token == null || token.isEmpty) {
            return buildHomeLayout(
              appbar: GuestAppbar(role: roleState.roleName),
            );
          }

          // 🟢 Logged in: استخدمي UserCubit
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
                  appbar: CustomerAppbar(model: userState.user),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          );
        },
      ),
    );
  }

  /// ------------------ UI مشتركة ------------------
  Widget buildHomeLayout({required Widget appbar}) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.h(12),
        left: SizeConfig.w(15),
        right: SizeConfig.w(15),
      ),
      child: ListView(
        children: [
          appbar,
          const SizedBox(height: 35),
          const PromoCarousel(),
          const SizedBox(height: 29),
          OfferSection(offers: offers, role: ""),
          const SizedBox(height: 27),
          const ProjectsSection(),
          const SizedBox(height: 42),
          const ReviewSection(),
        ],
      ),
    );
  }
}
