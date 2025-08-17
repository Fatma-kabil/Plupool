import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.onPressed});
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    bool isWide = SizeConfig.screenWidth > 800;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(isWide ? 30 : 15)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          minimumSize: Size(double.infinity, SizeConfig.h(57)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: AppTextStyles.styleBold20(
            context,
          ).copyWith(color: Colors.white, fontSize: isWide ? 38 : null),
        ),
      ),
    );
  }
}
