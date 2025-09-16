import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // النص على الشمال
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              label,
              style: AppTextStyles.styleSemiBold14(context),
            ),
          ),

          // الـ checkbox على اليمين
          AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: SizeConfig.w(15),
            height: SizeConfig.h(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                color: AppColors.ktextcolor,
                width: 1,
              ),
            ),
            child: value
                ? Icon(
                    Icons.check,
                    size: SizeConfig.w(12),
                    color: AppColors.kprimarycolor,
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
