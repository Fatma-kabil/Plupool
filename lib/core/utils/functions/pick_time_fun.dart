import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';

Future<TimeOfDay?> pickTimeFun(BuildContext context) async {
  return await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    cancelText: 'إلغاء',
    confirmText: 'تأكيد',
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          timePickerTheme: TimePickerThemeData(
            dayPeriodColor: WidgetStateColor.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return const Color.fromARGB(255, 165, 217, 245);
              }
              return Colors.white;
            }),
          ),
          colorScheme: const ColorScheme.light(
            primary: const Color.fromARGB(255, 165, 217, 245),
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
