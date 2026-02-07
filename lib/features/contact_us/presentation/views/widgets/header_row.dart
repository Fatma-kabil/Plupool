import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';

class HeaderRow extends StatelessWidget {
  const HeaderRow({super.key, required this.label, required this.value});
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.styleSemiBold16(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),
         Text(
          value,
          style: AppTextStyles.styleRegular16(
            context,
          ).copyWith(color: Color(0xff555555)),
        ),
      ],
    );
  }
}
