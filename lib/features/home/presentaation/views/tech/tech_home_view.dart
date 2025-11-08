import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_loading_indecator.dart';
import 'package:plupool/features/home/data/models/app_bar_model.dart';
import 'package:plupool/features/home/presentaation/views/guest_widgets/guest_appbar.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/tech_appbar.dart';
import 'package:plupool/features/home/presentaation/views/widgets/offer_section.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/tech_info_card_row.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/weekly_request_test.dart';
import 'package:plupool/features/home/presentaation/views/widgets/projects_section.dart';
import 'package:plupool/features/select_role/presentation/views/manager/select_role_cubit/select_role_cubit.dart';

class TechHomeView extends StatelessWidget {
  const TechHomeView({super.key});

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
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CustomLoadingIndecator());
        }

        final token = snapshot.data;

        return BlocBuilder<SelectRoleCubit, SelectRoleState>(
          builder: (context, state) {
            if (state is GetRoleSuccess) {
              return Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.h(12),
                  left: SizeConfig.w(17),
                  right: SizeConfig.w(17),
                ),
                child: ListView(
                  children: [
                    // ✅ GuestAppbar أو أي UI مختلف حسب التوكن
                    if (token == null)
                      GuestAppbar(role: state.roleName),
                    // ✅ لو فيه توكن ممكن تحط TechAppbar أو أي واجهة عادية
                    if (token != null)
                      // placeholder لو حابب تضيف UI مختلف
                      TechAppbar(
                        model: AppbarModel(
                          avatarUrl: 'assets/images/user1.png',
                          username: 'احمد محمد',
                          subtitle: 'فني صيانه حمامات سباحه',
                        ),
                      ),

                    const SizedBox(height: 30),
                    const TechInfoCardRow(),
                    const SizedBox(height: 30),
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(
                          "مهام الأسبوع",
                          style: AppTextStyles.styleBold20(context)
                              .copyWith(color: Colors.black),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            context.push('/weeklytasksview');
                          },
                          child: Text(
                            "عرض المزيد",
                            style: AppTextStyles.styleSemiBold16(context)
                                .copyWith(
                                  color: AppColors.kprimarycolor,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const WeeklyRequestsList(),
                    const SizedBox(height: 30),
                    OfferSection(offers: equipmentOffers),
                    const SizedBox(height: 30),
                    const ProjectsSection(),
                    const SizedBox(height: 30),
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
