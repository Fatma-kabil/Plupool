import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.controller, this.validator});
   final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    
    return TextFormField(
      controller: controller,
      validator: validator,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.right,
      cursorColor: Colors.black,
  
      decoration: InputDecoration(
        hintText: 'الاسم بالكامل',
         hintStyle: AppTextStyles.styleRegular16(context),
       
     //   fillColor: textFieldColor,
        filled: true,
        border: OutlineInputBorder(
  //  borderSide: BorderSide(color: textFieldBorderColor),
    borderRadius: BorderRadius.circular(12),
  ),
  enabledBorder: OutlineInputBorder(
//    borderSide: BorderSide(color: textFieldBorderColor),
    borderRadius: BorderRadius.circular(12),
  ),
  focusedBorder: OutlineInputBorder(
  //  borderSide: BorderSide(color: textFieldBorderColor, width: 2),
    borderRadius: BorderRadius.circular(12),
  ),
      ),
    );
  }
}