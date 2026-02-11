import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class FieldLabel extends StatelessWidget {
  final String text;
  const FieldLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: AppTextStyles.styleSemiBold16(
          context,
        ).copyWith(color: AppColors.ktextcolor),
      ),
    );
  }
}

class TextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int maxLines;
  final TextInputType keyboardType;

  const TextField({
    super.key,
    required this.controller,
    required this.hint,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: AppColors.kprimarycolor,
        cursorHeight: SizeConfig.isWideScreen
            ? SizeConfig.w(12)
            : SizeConfig.h(20),
        style: AppTextStyles.styleRegular14(
          context,
        ).copyWith(color: AppColors.ktextcolor),

        validator: (value) =>
            value == null || value.isEmpty ? 'الحقل مطلوب' : null,

        decoration: InputDecoration(
          isDense: true,

          /// ✅ بدل prefixIcon
          hintText: hint,
          hintStyle: AppTextStyles.styleRegular14(
            context,
          ).copyWith(color: AppColors.hintTextColor),

          contentPadding: EdgeInsets.symmetric(
            vertical: SizeConfig.h(SizeConfig.isWideScreen ? 9 : 11),
            horizontal: SizeConfig.w(12),
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.textFieldBorderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.textFieldBorderColor),
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
