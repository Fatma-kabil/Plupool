import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';

void showCustomSnackBar({
  required BuildContext context,
  required String message,
  bool isSuccess = false,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        textDirection: TextDirection.rtl,
        message, style: AppTextStyles.styleMedium16(context).copyWith(color: Colors.white),),
      backgroundColor: isSuccess ? Colors.green : Colors.grey[700],
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
