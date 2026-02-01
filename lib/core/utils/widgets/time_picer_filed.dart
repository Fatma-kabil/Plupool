import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class TimePickerField extends StatelessWidget {
  final TimeOfDay? selectedTime;
  final VoidCallback onTap;
  final String? errorText; // جديد
 final CrossAxisAlignment? dirc;
 final Color? selectedTimeColor;
 final Color? iconColor;
 final double? iconSize;
  const TimePickerField({
    super.key,
    required this.selectedTime,
    required this.onTap,
    this.errorText,
     this.dirc = CrossAxisAlignment.end,
     this.selectedTimeColor, this.iconColor, this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: dirc!,
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
              padding:  EdgeInsets.symmetric(horizontal:SizeConfig.w(10) , vertical:SizeConfig.isWideScreen?SizeConfig.h(9): SizeConfig.h(12)),
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
                    size: iconSize ?? (SizeConfig.isWideScreen?SizeConfig.h(20): SizeConfig.w(20)),
                    color: iconColor ?? AppColors.hintTextColor,
                  ),
                   SizedBox(width: SizeConfig.w(6)),
                  Text(
                    selectedTime != null
                        ? selectedTime!.format(context)
                        : "3.00 PM",
                    textDirection: TextDirection.ltr,
                    style: AppTextStyles.styleRegular14(context).copyWith(
                      color: selectedTime != null
                          ? selectedTimeColor ?? const Color(0xFF006398)
                          : AppColors.hintTextColor,
                    ),
                  ),
                  const Spacer(),
                 Icon(
                      Icons.keyboard_arrow_down,
                      size: SizeConfig.w(18),
                      color: const Color(0xff777777),
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
