

import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.icon,
  });
  final String hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
      
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
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
          prefix: Padding(
        padding: const EdgeInsets.only(left: 1), // تحكمي هنا في المسافة بين الايقونة والنص
        child: Icon(
          icon,
          size: SizeConfig.w(18),
          color: AppColors.hintTextColor,
        ),
      ),
 
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
              color: AppColors.kprimarycolor, // لون مميز عند الفوكس
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
