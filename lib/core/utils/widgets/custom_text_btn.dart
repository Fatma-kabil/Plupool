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
    this.padding,
    this.color,
    this.textStyle,
    this.trailing,
    this.isLoading = false,
  });

  final String text;
  final double? width;
  final double? padding;
  final void Function()? onPressed;
  final Color? color;
  final TextStyle? textStyle;
  final Widget? trailing;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed, // ✅ disable وقت اللودينج
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.kprimarycolor,
          foregroundColor: Colors.white,
          disabledBackgroundColor:
              (color ?? AppColors.kprimarycolor).withOpacity(0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: padding ?? SizeConfig.h(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textDirection: TextDirection.rtl,
                text,
                style: textStyle ??
                    AppTextStyles.styleSemiBold20(context),
              ),
              if (trailing != null) ...[
                SizedBox(width: SizeConfig.w(6)),
                trailing!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}