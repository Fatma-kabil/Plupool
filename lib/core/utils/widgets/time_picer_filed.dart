import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class TimePickerField extends StatelessWidget {
  final TimeOfDay? selectedTime;
  final VoidCallback onTap;
  final String? errorText; // جديد

  const TimePickerField({
    super.key,
    required this.selectedTime,
    required this.onTap,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "اختيار الوقت",
          style: AppTextStyles.styleSemiBold16(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: onTap,
          child: Directionality(
             textDirection: TextDirection.rtl,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                border: Border.all(
                  color: errorText != null
                      ? Colors.red.shade900
                      : AppColors.textFieldBorderColor,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: SizeConfig.w(18),
                    color
                        : AppColors.hintTextColor,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    selectedTime != null
                        ? selectedTime!.format(context)
                        : "3.00 PM",
                    textDirection: TextDirection.ltr,
                    style: AppTextStyles.styleRegular14(context).copyWith(
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
        ),
        if (errorText != null) ...[
          const SizedBox(height: 6),
          Text(
            errorText!,
            style: AppTextStyles.styleRegular14(
              context,
            ).copyWith(color: Colors.red[900]),
          ),
        ],
      ],
    );
  }
}
