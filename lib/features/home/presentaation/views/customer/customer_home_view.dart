import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/guest_widgets/guest_appbar.dart';
import 'package:plupool/features/home/presentaation/views/widgets/offer_section.dart';
import 'package:plupool/features/home/presentaation/views/widgets/projects_section.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/promo_carousel.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/reviews_section.dart';
import 'package:plupool/features/select_role/presentation/views/manager/select_role_cubit/select_role_cubit.dart';
import 'package:plupool/core/di/service_locator.dart';

class CustomerHomeView extends StatelessWidget {
  const CustomerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SelectRoleCubit>()..getSavedRole(),
      child: BlocBuilder<SelectRoleCubit, SelectRoleState>(
        builder: (context, state) {
          if (state is GetRoleSuccess) {
            // ✅ الدور اتحفظ واتجاب بنجاح
            return Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.h(12),
                left: SizeConfig.w(15),
                right: SizeConfig.w(15),
              ),
              child: ListView(
                children: [
                  GuestAppbar( role: state.roleName,), // ✅ مررنا الدور
                  SizedBox(height: 35),
                  const PromoCarousel(),
                  SizedBox(height: 29),
                  OfferSection(offers: offers),
                  SizedBox(height: 27),
                  const ProjectsSection(),
                  SizedBox(height: 42),
                  const ReviewSection(),
                ],
              ),
            );
          }

          // ⏳ لو لسه بيجيب الدور
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
