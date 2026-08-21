import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_loading_indecator.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_state.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/customer_appbar.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/owner_offer_carusal_bloc.dart';
import 'package:plupool/features/home/presentaation/views/guest_widgets/guest_appbar.dart';
import 'package:plupool/features/home/presentaation/views/widgets/projects_section.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/promo_carousel.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/reviews_section.dart';
import 'package:plupool/features/offers/presentation/manager/cubits/offer_cubit/offer_cubit.dart';
import 'package:plupool/features/projects/presentation/manager/project_cubit/project_cubit.dart';
import 'package:plupool/features/rating/presentation/manager/cubits/rating_cubit/ratings_cubit.dart';
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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SelectRoleCubit>().getSavedRole();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return BlocBuilder<SelectRoleCubit, SelectRoleState>(
      builder: (context, roleState) {
        // =========================
        // Loading Role
        // =========================
        if (roleState is GetRoleLoading) {
          return const Center(child: CustomLoadingIndecator());
        }

        // =========================
        // Error Role
        // =========================
        if (roleState is GetRoleError) {
          return const Center(child: Text('حدث خطأ أثناء تحميل الدور'));
        }

        final roleName = roleState is GetRoleSuccess
            ? roleState.roleName
            : 'ضيف';

        // =========================
        // Auth State
        // =========================
        return BlocBuilder<AuthCubit, AuthState>(
          builder: (context, authState) {
            debugPrint('CustomerHomeView => status: ${authState.status}');
            debugPrint('CustomerHomeView => token: ${authState.token}');

            // =========================
            // GUEST
            // =========================
            if (authState.status == AuthStatus.guest ||
                authState.token == null ||
                authState.token!.isEmpty) {
              return _buildHomeLayout(appbar: GuestAppbar(role: roleName));
            }

            // =========================
            // LOGGED IN
            // =========================
            return _buildHomeLayout(appbar: CustomerAppbar());
          },
        );
      },
    );
  }

  Widget _buildHomeLayout({required Widget appbar}) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.h(12),
        left: SizeConfig.w(15),
        right: SizeConfig.w(15),
      ),
      child: RefreshIndicator(
        color: Colors.black54,
        backgroundColor: AppColors.kScaffoldColor,
        onRefresh: () async {
          await Future.wait([
            context.read<OfferCubit>().fetchOffers(),
            context.read<OurProjectsCubit>().getProjects(),
            context.read<RatingsCubit>().getRatings(status: "approved"),
          ]);
        },
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            appbar,
            const SizedBox(height: 20),
            const PromoCarousel(),
            const SizedBox(height: 29),
            OwnerOfferCarusalBloc(),
            const ProjectsSection(),
            const ReviewSection(),
          ],
        ),
      ),
    );
  }
}
