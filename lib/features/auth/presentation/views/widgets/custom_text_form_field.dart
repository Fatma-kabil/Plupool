import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.controller,
  });

  final String hintText;
  final IconData icon;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText; // نبدأ بنفس القيمة اللي اتبعتت
  }

  void _toggleObscure() {
    setState(() {
      _obscure = !_obscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        cursorColor: AppColors.kprimarycolor,
        controller: widget.controller,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        obscureText: _obscure,
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
            padding: const EdgeInsets.only(right: 6.0),
            child: Icon(
              widget.icon,
              size: SizeConfig.w(18),
              color: AppColors.hintTextColor,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(minWidth: 0),

          // 👇 زرار إظهار/إخفاء الباسورد
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                    _obscure ? Icons.visibility_off : Icons.visibility,
                    size: SizeConfig.w(18),
                    color: AppColors.hintTextColor,
                  ),
                  onPressed: _toggleObscure,
                )
              : null,

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
        ),
      ),
    );
  }
}
