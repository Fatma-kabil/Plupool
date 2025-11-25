import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/profile/presentation/views/widgets/confirm_delete_card.dart';
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
    return Column(
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
          textDirection: TextDirection.rtl,
          "قبل المتابعة، يرجى تأكيد رغبتك في حذف الحساب بشكل نهائي.",
          style: AppTextStyles.styleRegular16(
            context,
          ).copyWith(color: const Color(0xff555555)),
        ),
        SizedBox(height: SizeConfig.h(20)),

        DeleteWarningCard(
          value: acceptedTerms,
          onChanged: (val) {
            setState(() => acceptedTerms = val);
          },
        ),

        Spacer(),

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
              barrierDismissible: false, // يمنع الإغلاق بالضغط خارج الكارد
              builder: (context) => const ConfirmDeleteCard(),
            );
          },
        ),

        SizedBox(height: SizeConfig.h(15)),
      ],
    );
  }
}
