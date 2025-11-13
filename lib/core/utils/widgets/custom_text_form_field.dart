import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.icon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.controller,
    this.prefixIcon,
  });

  final String hintText;
  final IconData? icon;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        style: AppTextStyles.styleMedium16(
          context,
        ).copyWith(color: AppColors.ktextcolor),
        cursorHeight: SizeConfig.isWideScreen
            ? SizeConfig.w(12)
            : SizeConfig.h(20),
        cursorColor: AppColors.kprimarycolor,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,

        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.textFieldBorderColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: hintText,
          hintStyle: AppTextStyles.styleRegular13(context),
          contentPadding: EdgeInsets.symmetric(
            vertical: SizeConfig.h(10),
            horizontal: SizeConfig.w(14),
          ),

          prefixIcon: Padding(
            padding: EdgeInsets.only(right: SizeConfig.w(7),left: SizeConfig.w(2) ),
            child:
                prefixIcon ??
                Icon(
                  icon,
                  size: SizeConfig.isWideScreen
                      ? SizeConfig.h(15)
                      : SizeConfig.w(13),
                  color: const Color(0xffBBBBBB),
                ),
          ),
          prefixIconConstraints: const BoxConstraints(minWidth: 0),

          // 👇 زرار إظهار/إخفاء الباسورد
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: AppColors.textFieldBorderColor,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: AppColors.kprimarycolor, width: 1.0),
          ),
           errorStyle: AppTextStyles.styleRegular13(context).copyWith(color: Colors.red)
        ),
      ),
    );
  }
}
