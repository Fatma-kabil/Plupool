import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("لا تمتلك حساب؟", style: AppTextStyles.styleMedium18(context)),
        GestureDetector(
          onTap: () {
            // هنا هتروح لشاشة إنشاء حساب
          },
          child: Text(
            "قم بإنشاء حساب " ,
            style: AppTextStyles.styleNormal18(context),
          ),
        ),
      ],
    );
  }
}
