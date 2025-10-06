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
  const DatePickerField({
    super.key,
    required this.selectedDate,
    required this.dateFormat,
    required this.onTap,
    this.errorText,
    this.dirc = CrossAxisAlignment.end
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:dirc!,

      children: [
        Text(
          "اختيار اليوم",
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
                    Icons.calendar_today,
                    size: SizeConfig.w(15),
                    color: AppColors.hintTextColor,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    selectedDate != null
                        ? dateFormat?.call(selectedDate!) ??
                              selectedDate.toString()
                        : "dd/mm/yy",
                    style: AppTextStyles.styleRegular14(context).copyWith(
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
