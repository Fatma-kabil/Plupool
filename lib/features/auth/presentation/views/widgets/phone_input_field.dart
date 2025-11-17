import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class PhoneInputField extends StatefulWidget {
  const PhoneInputField({super.key, this.validator, required this.controller});

  final String? Function(String?)? validator;
  final TextEditingController controller;

  // خلي الـ State class public
  @override
  PhoneInputFieldState createState() => PhoneInputFieldState();
}

class PhoneInputFieldState extends State<PhoneInputField> {
  String selectedCountryCode = '+20';
  String selectedCountryFlag = '🇪🇬';

  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (country) {
        setState(() {
          selectedCountryCode = '+${country.phoneCode}';
          selectedCountryFlag = country.flagEmoji;
        });
      },
    );
  }

  String getFullPhoneNumber() {
    return '$selectedCountryCode${widget.controller.text.trim()}';
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
         textDirection: TextDirection.ltr,  // ← الأفضل لرقم الهاتف
  textAlign: TextAlign.right,

        style: AppTextStyles.styleMedium16(context)
            .copyWith(color: AppColors.ktextcolor),
        cursorHeight: SizeConfig.isWideScreen ? SizeConfig.w(12) : SizeConfig.h(20),
        cursorColor: AppColors.kprimarycolor,
        controller: widget.controller,
        validator: widget.validator,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.only(right: SizeConfig.w(7),left: SizeConfig.w(2)  
            ),
            child: Icon(
                  Icons.phone,
                  size: SizeConfig.isWideScreen ? SizeConfig.h(15) : SizeConfig.w(13),
                  color: const Color(0xffBBBBBB),
                ),
          ), 
          hint: Text(
            'أدخل رقم الهاتف',
            style: AppTextStyles.styleRegular13(context)
                .copyWith(color: const Color(0xffBBBBBB)),
          ),
          filled: true,
          fillColor: Colors.transparent,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.w(8),
              right: SizeConfig.w(6),
              top: SizeConfig.h(3),
              bottom: SizeConfig.h(3),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: InkWell(
                  onTap: _showCountryPicker,
                  child: Row(
                    textDirection: TextDirection.ltr,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_drop_down, size: SizeConfig.w(15)),
                      SizedBox(width: SizeConfig.w(4)),
                      Text(
                        selectedCountryFlag,
                        style: TextStyle(fontSize: SizeConfig.w(15)),
                      ),
                      SizedBox(width: SizeConfig.w(4)),
                      Text(
                        '($selectedCountryCode)',
                        style: AppTextStyles.styleRegular13(context)
                            .copyWith(color: const Color(0xff000000)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFD6D6D6), width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFD6D6D6), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF0077B6), width: 1.5),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: SizeConfig.w(10),
          ),
        ),
      ),
    );
  }
}
