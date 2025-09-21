import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';

class TimePickerField extends StatelessWidget {
  final TimeOfDay? selectedTime;
  final VoidCallback onTap;

  const TimePickerField({
    super.key,
    required this.selectedTime,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "اختيار الوقت",
          style: AppTextStyles.styleSemiBold16(context)
              .copyWith(color: AppColors.ktextcolor),
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.textFieldBorderColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.access_time,
                  size: 15,
                  color: selectedTime != null
                      ? const Color(0xFF006398)
                      : AppColors.hintTextColor,
                ),
                const SizedBox(width: 3),
                Text(
                  selectedTime != null
                      ? selectedTime!.format(context)
                      : "3.00 PM",
                //    textAlign: TextAlign.start,
                  textDirection: TextDirection.ltr,
                  style: AppTextStyles.styleRegular13(context).copyWith(
                    color: selectedTime != null
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
      ],
    );
  }
}
