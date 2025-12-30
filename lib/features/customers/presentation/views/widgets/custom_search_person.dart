import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomSearchPerson extends StatelessWidget {
  const CustomSearchPerson({
    super.key,
    this.validator,
    this.controller,
    required this.hintText,
  });
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        style: AppTextStyles.styleMedium16(
          context,
        ).copyWith(color: AppColors.ktextcolor),
        cursorHeight: SizeConfig.isWideScreen
            ? SizeConfig.w(8)
            : SizeConfig.h(15),
        cursorColor: AppColors.hintTextColor,
        controller: controller,
        validator: validator,

        //   keyboardType: keyboardType,
        decoration: InputDecoration(
          isDense: true,
          prefixIconConstraints: const BoxConstraints(
            minHeight: 0,
            minWidth: 0,
          ),
          suffixIconConstraints: const BoxConstraints(
            minHeight: 0,
            minWidth: 0,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: SizeConfig.h(10), // 👈 قلّلي الرقم حسب ما تحبي
            horizontal: SizeConfig.w(12),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.textFieldBorderColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: hintText,
          hintStyle: AppTextStyles.styleRegular13(
            context,
          ).copyWith(color: AppColors.hintTextColor),

          prefixIcon: Padding(
            padding: EdgeInsets.only(
              right: SizeConfig.w(7),
              left: SizeConfig.w(0),
            ),
            child: Icon(
              Icons.person_2_outlined,
              size: SizeConfig.isWideScreen
                  ? SizeConfig.h(10)
                  : SizeConfig.w(14),
              color: const Color(0xff999999),
            ),
          ),

          suffixIcon: Padding(
            padding: EdgeInsets.only(left: SizeConfig.w(7)),
            child: Icon(
              Icons.keyboard_arrow_down,
              size: SizeConfig.isWideScreen
                  ? SizeConfig.h(10)
                  : SizeConfig.w(14),
              color: const Color(0xff999999),
            ),
          ),
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
            borderSide: BorderSide(color: AppColors.hintTextColor, width: 2.0),
          ),
          errorStyle: AppTextStyles.styleRegular13(
            context,
          ).copyWith(color: Colors.red),
        ),
      ),
    );
  }
}
