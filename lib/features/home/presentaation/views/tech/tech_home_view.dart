import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/guest_widgets/guest_appbar.dart';
import 'package:plupool/features/home/presentaation/views/widgets/offer_section.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/tech_info_card_row.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/weekly_request_test.dart';
import 'package:plupool/features/home/presentaation/views/widgets/projects_section.dart';
import 'package:plupool/features/select_role/presentation/views/manager/select_role_cubit/select_role_cubit.dart';

class TechHomeView extends StatefulWidget {
  const TechHomeView({super.key});

  @override
  State<TechHomeView> createState() => _TechHomeViewState();
}

class _TechHomeViewState extends State<TechHomeView> {
    void initState() {
    super.initState();
    context.read<SelectRoleCubit>().getSavedRole(); // ✅ مرة واحدة فقط
  }

  @override
  Widget build(BuildContext context) {
    return// BlocProvider(
   //   create: (_) => sl<SelectRoleCubit>()..getSavedRole(),
    //  child:
     BlocBuilder<SelectRoleCubit, SelectRoleState>(
        builder: (context, state) {
          if (state is GetRoleSuccess) {
            // ✅ لازم نرجّع الويجت هنا
            return Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.h(12),
                left: SizeConfig.w(17),
                right: SizeConfig.w(17),
              ),
              child: ListView(
                children: [
                  GuestAppbar(role: state.roleName), // ✅ مررنا الدور
                  SizedBox(height: 30),
                  const TechInfoCardRow(),
                  SizedBox(height: 30),
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
                          style: AppTextStyles.styleSemiBold16(context).copyWith(
                                color: AppColors.kprimarycolor,
                                decoration: TextDecoration.underline,
                              ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  const WeeklyRequestsList(),
                  SizedBox(height: 30),
                  OfferSection(offers: equipmentOffers),
                  SizedBox(height: 30),
                  const ProjectsSection(),
                  SizedBox(height: 30),
                ],
              ),
            );
          }

          // ⏳ لو لسه بيجيب الدور
          return const Center(child: CircularProgressIndicator());
        },
   //   ),
    );
  }
}
