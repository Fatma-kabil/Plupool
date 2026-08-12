import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/home/presentaation/views/widgets/app_bar_details.dart';
import 'package:plupool/features/home/presentaation/views/widgets/app_bar_shimmer.dart';
import 'package:plupool/features/home/presentaation/views/widgets/notification_button.dart';
import 'package:plupool/features/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:plupool/features/profile/presentation/manager/user_cubit/user_state.dart';

class CustomerAppbar extends StatelessWidget {
  const CustomerAppbar({super.key});

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
              AppBarDetails(model: user),
              const Spacer(),

              // 📞 تواصل معنا
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
