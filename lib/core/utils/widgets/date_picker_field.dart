import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
class DatePickerField extends StatelessWidget {
  final DateTime? selectedDate;
  final intl.DateFormat dateFormat;
  final VoidCallback onTap;
  final String? errorText; // << هنا

  const DatePickerField({
    super.key,
    required this.selectedDate,
    required this.dateFormat,
    required this.onTap,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "اختيار اليوم",
          style: AppTextStyles.styleSemiBold16(context)
              .copyWith(color: AppColors.ktextcolor),
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(
                color: errorText != null
                    ? Colors.red
                    : AppColors.textFieldBorderColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 15,
                  color: selectedDate != null
                      ? const Color(0xFF006398)
                      : AppColors.hintTextColor,
                ),
                const SizedBox(width: 3),
                Text(
                  selectedDate != null
                      ? dateFormat.format(selectedDate!)
                      : "dd/mm/yy",
                  style: AppTextStyles.styleRegular13(context).copyWith(
                    color: selectedDate != null
                        ? const Color(0xFF006398)
                        : AppColors.hintTextColor,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.hintTextColor,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
        if (errorText != null) ...[
          const SizedBox(height: 6),
          Text(
            errorText!,
            style: AppTextStyles.styleRegular13(context)
                .copyWith(color: Colors.red),
          ),
        ],
      ],
    );
  }
}
