import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomTextBtn extends StatelessWidget {
  const CustomTextBtn({
    super.key,
    required this.text,
    this.onPressed,
    this.width,
    this.padding,  this.color, this.textStyle,
  });
  final String text;
  final double? width;
  final double? padding;
  final void Function()? onPressed;
  final Color? color;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:color?? AppColors.kprimarycolor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // ✅ صححت هنا
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: padding ?? SizeConfig.h(12)),
          child: Text(
            textDirection: TextDirection.rtl,
            text,
            style:textStyle?? AppTextStyles.styleSemiBold20(context),
          ),
        ),
      ),
    );
  }
}
