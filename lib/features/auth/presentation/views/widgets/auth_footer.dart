import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({super.key});

  @override
  Widget build(BuildContext context) {
    bool isWide = SizeConfig.screenWidth > 800;
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "لا تمتلك حساب؟",
          style: AppTextStyles.styleMedium18(
            context,
          ).copyWith(fontSize: isWide ? 28 : null),
        ),
        GestureDetector(
          onTap: () {
            // هنا هتروح لشاشة إنشاء حساب
          },
          child: Text(
            "قم بإنشاء حساب ",
            style: AppTextStyles.styleNormal18(
              context,
            ).copyWith(fontSize: isWide ? 28 : null),
          ),
        ),
      ],
    );
  }
}
