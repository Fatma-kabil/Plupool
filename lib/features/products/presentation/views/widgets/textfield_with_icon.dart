import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class TextFieldWithIcon extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int maxLines;
  final TextInputType keyboardType;
  final IconData? icon;

  const TextFieldWithIcon({
    super.key,
    required this.controller,
    required this.hint,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        cursorColor: AppColors.kprimarycolor,
        cursorHeight: SizeConfig.isWideScreen
            ? SizeConfig.w(12)
            : SizeConfig.h(20),
        textAlignVertical: TextAlignVertical.center,
        style: AppTextStyles.styleRegular14(context)
            .copyWith(color: AppColors.ktextcolor),
        validator: (value) =>
            value == null || value.isEmpty ? 'الحقل مطلوب' : null,
        decoration: InputDecoration(
           prefixIconConstraints: const BoxConstraints(
            minHeight: 0,
            minWidth: 0,
          ),
          suffixIconConstraints: const BoxConstraints(
            minHeight: 0,
            minWidth: 0,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: SizeConfig.h(12), // 👈 قلّلي الرقم حسب ما تحبي
            horizontal: SizeConfig.w(12),
          ),
          isDense: true,
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              right: SizeConfig.w(7),
              left: SizeConfig.isWideScreen ? SizeConfig.w(5) : SizeConfig.w(0),
            ),
            child: Icon(
              icon,   // لو مفيش أيقونة نخليها شفافة
              size: SizeConfig.w(15),
              color:   Color(0xff777777)
            ),
          ),

          hintText: hint,
          hintStyle: AppTextStyles.styleRegular14(context)
              .copyWith(color: AppColors.hintTextColor),
         
          
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.textFieldBorderColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.textFieldBorderColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.textFieldBorderColor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
