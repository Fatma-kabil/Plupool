import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/header_text.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:plupool/features/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:plupool/features/profile/presentation/manager/user_cubit/user_state.dart';

class ConfirmDeleteCard extends StatelessWidget {
  const ConfirmDeleteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(16),
        vertical: SizeConfig.h(29),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(16),
          vertical: SizeConfig.h(20),
        ),
        decoration: BoxDecoration(
          color: AppColors.kScaffoldColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const HeaderText(
              title: 'هل أنت متأكد؟',
              subtitle:
                  'سيتم حذف حسابك بشكل نهائي ولن تتمكن من استعادته. هل تريد المتابعة؟',
            ),
            SizedBox(height: SizeConfig.h(30)),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xffE63946)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      "لا",
                      style: AppTextStyles.styleMedium16(
                        context,
                      ).copyWith(color: const Color(0xffE63946)),
                    ),
                  ),
                ),
                SizedBox(width: SizeConfig.w(18)),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffE63946),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      final authCubit = context.read<AuthCubit>();
                      final userCubit = context.read<UserCubit>();

                      Navigator.pop(context); // يقفل confirm dialog

                      final state = userCubit.state;
                      if (state is UserLoaded) {
                        userCubit.deleteUser(
                          state.user.id,
                          authCubit.state.token!,
                        );
                      }
                    },

                    child: Text(
                      "نعم",
                      style: AppTextStyles.styleMedium16(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
