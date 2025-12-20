import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_loading_indecator.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:plupool/features/profile/presentation/manager/user_cubit/user_state.dart';
import 'package:plupool/features/profile/presentation/views/widgets/confirm_delete_card.dart';
import 'package:plupool/features/profile/presentation/views/widgets/delete_account_done_card.dart';
import 'package:plupool/features/profile/presentation/views/widgets/delete_warning_card.dart';

class DeleteAccountViewBody extends StatefulWidget {
  const DeleteAccountViewBody({super.key});

  @override
  State<DeleteAccountViewBody> createState() => _DeleteAccountViewBodyState();
}

class _DeleteAccountViewBodyState extends State<DeleteAccountViewBody> {
  bool acceptedTerms = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        /// Loading
        if (state is DeleteUserLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(
              child: CustomLoadingIndecator(),
            ),
          );
        }

        /// Success → اظهر الدايلوج
        if (state is DeleteUserSuccess) {
          Navigator.of(context, rootNavigator: true).pop(); // يقفل loading

          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const DeleteAccountDoneCard(),
          );
        }

        /// Error
        if (state is DeleteUserError) {
          Navigator.of(context, rootNavigator: true).pop();

          showCustomSnackBar(
            context: context,
            message: state.message,
          );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          Text(
            "حذف الحساب",
            style: AppTextStyles.styleSemiBold20(
              context,
            ).copyWith(color: AppColors.ktextcolor),
          ),
          SizedBox(height: SizeConfig.h(4)),
          Text(
            "قبل المتابعة، يرجى تأكيد رغبتك في حذف الحساب بشكل نهائي.",
            style: AppTextStyles.styleRegular16(
              context,
            ).copyWith(color: const Color(0xff555555)),
            textDirection: TextDirection.rtl,
          ),
          SizedBox(height: SizeConfig.h(20)),

          DeleteWarningCard(
            value: acceptedTerms,
            onChanged: (val) {
              setState(() => acceptedTerms = val);
            },
          ),

          const Spacer(),

          CustomTextBtn(
            width: double.infinity,
            text: 'حذف الحساب',
            color: const Color(0xffE63946),
            onPressed: () {
              if (!acceptedTerms) {
                showCustomSnackBar(
                  context: context,
                  message: 'يجب الموافقة أولاً قبل متابعة حذف الحساب',
                );
                return;
              }

              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => const ConfirmDeleteCard(),
              );
            },
          ),

          SizedBox(height: SizeConfig.h(15)),
        ],
      ),
    );
  }
}
