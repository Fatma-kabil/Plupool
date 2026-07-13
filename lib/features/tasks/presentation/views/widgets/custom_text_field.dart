import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/consruction_service/presentation/views/widgets/custom_pool_details%20_form.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.icon,
    this.lines = 1,
    this.validator,
    this.controller,
    this.prefixIcon,
    this.keyboardType = TextInputType.number,
  });

  final String hintText;
  final IconData? icon;
  final TextInputType keyboardType;
  final int lines;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        textDirection: TextDirection.rtl,
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
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9٠-٩.]')),
          ArabicNumberFormatter(),
        ],
        maxLines: lines,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.textFieldBorderColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: hintText,
          hintStyle: AppTextStyles.styleRegular16(
            context,
          ).copyWith(color: Color(0xffBBBBBB)),
          contentPadding: EdgeInsets.symmetric(
            vertical: SizeConfig.isWideScreen
                ? SizeConfig.h(8)
                : SizeConfig.h(0),
            horizontal: SizeConfig.w(14),
          ),

          prefixIcon: Padding(
            padding: EdgeInsets.only(right: SizeConfig.w(7)),
            child:
                prefixIcon ??
                Icon(
                  icon,
                  size: SizeConfig.isWideScreen
                      ? SizeConfig.h(20)
                      : SizeConfig.w(20),
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
          errorStyle: AppTextStyles.styleRegular13(
            context,
          ).copyWith(color: Colors.red),
        ),
      ),
    );
  }
}
