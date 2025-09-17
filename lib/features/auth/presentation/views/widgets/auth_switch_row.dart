import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';

class AuthSwitchRow extends StatelessWidget {
  final String leadingText; // النص الأول (مثال: لدي حساب بالفعل)
  final String actionText;  // النص القابل للضغط (مثال: تسجيل الدخول)
  final VoidCallback onTap; // الإجراء عند الضغط

  const AuthSwitchRow({
    super.key,
    required this.leadingText,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          leadingText,
          style: AppTextStyles.styleBold13(context),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionText,
            style: AppTextStyles.styleSemiBold14(context).copyWith(
              color: AppColors.kprimarycolor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
