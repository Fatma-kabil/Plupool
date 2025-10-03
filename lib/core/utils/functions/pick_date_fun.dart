import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';

Future<DateTime?> pickDateFun(BuildContext context) async {
  return await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(const Duration(days: 365)),
    cancelText: 'إلغاء',
    confirmText: 'تأكيد',
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: AppColors.kprimarycolor,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.kprimarycolor,
            ),
          ),
        ),
        child: child!,
      );
    },
  );
}
