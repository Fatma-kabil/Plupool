import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({
    super.key,
    required this.text,
    required this.textbutton,
    this.onTap,
  });
  final String text;
  final String textbutton;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    bool isWide = SizeConfig.screenWidth > 800;
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppTextStyles.styleMedium18(
            context,
          ).copyWith(fontSize: isWide ? 28 : null),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            textbutton,
            style: AppTextStyles.styleNormal18(
              context,
            ).copyWith(fontSize: isWide ? 28 : null),
          ),
        ),
      ],
    );
  }
}
