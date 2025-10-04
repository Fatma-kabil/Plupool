import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomPoolDetailsForm extends StatefulWidget {
  const CustomPoolDetailsForm({
    super.key,
    required this.hintText,

    this.validator,
    required this.controller,
    required this.iconpath,
  });

  final String hintText;

  final String iconpath;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  @override
  State<CustomPoolDetailsForm> createState() => _CustomPoolDetailsFormState();
}

class _CustomPoolDetailsFormState extends State<CustomPoolDetailsForm> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        cursorColor: AppColors.kprimarycolor,
        controller: widget.controller,
        validator: widget.validator,
        keyboardType: TextInputType.number,
        style: AppTextStyles.styleRegular13(context).copyWith(
          color: AppColors.kprimarycolor, // لون النص اللي اليوزر بيكتبه
          // سمك الخط
          fontSize: SizeConfig.w(14), // حجم الخط
        ),

        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.textFieldBorderColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: widget.hintText,
          hintStyle: AppTextStyles.styleRegular13(context),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 14.0,
          ),

          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset(
              widget.iconpath,
              color: AppColors.hintTextColor,
              height: SizeConfig.h(22),
              width: SizeConfig.w(22),
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
            borderSide: BorderSide(
              color: AppColors.textFieldBorderColor,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
