import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_loading_indecator.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/customer_appbar.dart';
import 'package:plupool/features/home/presentaation/views/guest_widgets/guest_appbar.dart';
import 'package:plupool/features/home/presentaation/views/widgets/offer_section.dart';
import 'package:plupool/features/home/presentaation/views/widgets/projects_section.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/promo_carousel.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/reviews_section.dart';
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
    context.read<SelectRoleCubit>().getSavedRole();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return BlocBuilder<SelectRoleCubit, SelectRoleState>(
      builder: (context, roleState) {
        // 🔄 Loading role
        if (roleState is GetRoleLoading) {
          return const Center(
            child: CustomLoadingIndecator(),
          );
        }

        // ❌ Error (اختياري)
        if (roleState is GetRoleError) {
          return const Center(
            child: Text('حدث خطأ أثناء تحميل الدور'),
          );
        }

        final roleName =
            roleState is GetRoleSuccess ? roleState.roleName : 'ضيف';

        final token = context.watch<AuthCubit>().state.token ?? '';

        // 🟡 Guest
        if (token.isEmpty) {
          return _buildHomeLayout(
            appbar: GuestAppbar(role: roleName),
          );
        }

        // 🟢 Logged In
        return _buildHomeLayout(
          appbar: CustomerAppbar(role: roleName),
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
      child: ListView(
        children: [
          appbar,
          const SizedBox(height: 35),

          const PromoCarousel(),
          const SizedBox(height: 29),

          OfferSection(
            offers: offers,
            role: " ",
          ),
          const SizedBox(height: 27),

          const ProjectsSection(),
          const SizedBox(height: 42),

          const ReviewSection(imageUrl: ""),
        ],
      ),
    );
  }
}
