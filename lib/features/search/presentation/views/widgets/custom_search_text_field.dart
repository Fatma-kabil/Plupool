import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustumSearchTextField extends StatelessWidget {
  const CustumSearchTextField({super.key, this.validator, this.controller});
  final String? Function(String?)? validator;
  final TextEditingController? controller;

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
        cursorColor: AppColors.hintTextColor,
        controller: controller,
        validator: validator,
     //   keyboardType: keyboardType,

        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.textFieldBorderColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: "بحث",
          hintStyle: AppTextStyles.styleRegular16(context).copyWith(
            color: AppColors.hintTextColor,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: SizeConfig.h(8),
            horizontal: SizeConfig.w(8),
          ),

          prefixIcon: Padding(
            padding: EdgeInsets.only(right: SizeConfig.w(7),left: SizeConfig.w(0) ),
            child:
              
                Icon(
                  Icons.search,
                  size: SizeConfig.isWideScreen
                      ? SizeConfig.h(15)
                      : SizeConfig.w(18),
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
            borderSide: BorderSide(color: AppColors.hintTextColor, width: 2.0),
          ),
           errorStyle: AppTextStyles.styleRegular13(context).copyWith(color: Colors.red)
        ),
      ),
    );
  }
}
