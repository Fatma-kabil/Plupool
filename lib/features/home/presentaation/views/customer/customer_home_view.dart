import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_loading_indecator.dart';
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

  // 🔹 إنشاء Storage
  static final storage = const FlutterSecureStorage();

  // 🔹 دالة قراءة التوكن
  Future<String?> _getToken() async {
    return await storage.read(key: 'token');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _getToken(),
      builder: (context, snapshot) {
        // ⏳ Loading أثناء قراءة التوكن
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CustomLoadingIndecator());
        }

        final token = snapshot.data; // null لو مش موجود

        return BlocBuilder<SelectRoleCubit, SelectRoleState>(
          builder: (context, state) {
            if (state is GetRoleSuccess) {
              return Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.h(12),
                  left: SizeConfig.w(15),
                  right: SizeConfig.w(15),
                ),
                child: ListView(
                  children: [
                    // ✅ CustomerAppbar لو فيه توكن
                    if (token != null)
                      CustomerAppbar(
                        model: AppbarModel(
                          avatarUrl: 'assets/images/user1.png',
                          username: 'احمد محمد',
                          subtitle: 'صاحب حماح سباكه',
                        ),
                      ),

                    // ✅ GuestAppbar لو التوكن مش موجود
                    if (token == null) GuestAppbar(role: state.roleName),

                    const SizedBox(height: 35),
                    const PromoCarousel(),
                    const SizedBox(height: 29),
                    OfferSection(offers: offers),
                    const SizedBox(height: 27),
                    const ProjectsSection(),
                    const SizedBox(height: 42),
                    const ReviewSection(),
                  ],
                ),
              );
            }

            // ⏳ لو الدور لسه بيجلب
            return const Center(child: CustomLoadingIndecator());
          },
        );
      },
    );
  }
}
