import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class DatePickerField extends StatelessWidget {
  final DateTime? selectedDate;
  final String Function(DateTime)? dateFormat;

  final VoidCallback onTap;
  final String? errorText; // << هنا
  final CrossAxisAlignment? dirc;
  final String? text;
  final double? iconSize;
  final Color? iconColor;

  final Color? selectedDateColor;
  const DatePickerField({
    super.key,
    required this.selectedDate,
    required this.dateFormat,
    required this.onTap,
    this.errorText,
    this.dirc = CrossAxisAlignment.end, this.selectedDateColor, this.text, this.iconSize, this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: dirc!,

      children: [
        Text(
        text??  "اختيار اليوم",
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
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(10),
                vertical: SizeConfig.isWideScreen
                    ? SizeConfig.h(8)
                    : SizeConfig.h(12),
              ),
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
                    Icons.calendar_today,
                    size: iconSize ?? (SizeConfig.isWideScreen
                        ? SizeConfig.h(18)
                        : SizeConfig.w(17)),
                    color: iconColor ?? AppColors.hintTextColor,
                  ),
                  SizedBox(width: SizeConfig.w(6)),
                  Text(
                    selectedDate != null
                        ? dateFormat?.call(selectedDate!) ??
                              selectedDate.toString()
                        : "dd/mm/yy",
                    style: AppTextStyles.styleRegular14(context).copyWith(
                      color: selectedDate != null
                          ?selectedDateColor?? const Color(0xFF006398)
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
