import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_loading_indecator.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/contact_us_card.dart';
import 'package:plupool/features/home/presentaation/views/widgets/app_bar_details.dart';
import 'package:plupool/features/home/presentaation/views/widgets/app_bar_shimmer.dart';
import 'package:plupool/features/home/presentaation/views/widgets/notification_button.dart';
import 'package:plupool/features/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:plupool/features/profile/presentation/manager/user_cubit/user_state.dart';

class CustomerAppbar extends StatelessWidget {
  final String role;

  const CustomerAppbar({
    super.key,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        // 🔄 Loading
        if (state is UserLoading) {
          return AppbarShimmer();
        }

        // ❌ Error
        if (state is UserError) {
          return Text(
            'حدث خطأ أثناء تحميل البيانات',
            style: AppTextStyles.styleBold13(context),
          );
        }

        // ✅ Loaded
        if (state is UserLoaded) {
          final user = state.user;

          return Row(
            children: [
              AppBarDetails(
                model: user,
                role: role,
              ),
              const Spacer(),

              // 📞 تواصل معنا
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const Dialog(
                      backgroundColor: Colors.white,
                      insetPadding: EdgeInsets.all(20),
                      child: ContactUsCard(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.kprimarycolor),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.w(5),
                      vertical: SizeConfig.h(5),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: AppColors.kprimarycolor,
                          size: SizeConfig.w(14),
                        ),
                        SizedBox(width: SizeConfig.w(2)),
                        Text(
                          'تواصل معنا',
                          style: AppTextStyles.styleBold13(context)
                              .copyWith(color: AppColors.kprimarycolor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(width: SizeConfig.w(10)),

              NotificationButton(
                onTap: () {
                  context.push('/customernotificationview');
                },
              ),
            ],
          );
        }

        // fallback
        return const SizedBox.shrink();
      },
    );
  }
}
