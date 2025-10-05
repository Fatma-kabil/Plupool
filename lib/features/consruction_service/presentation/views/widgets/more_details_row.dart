
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';

class MoreDetailsRow extends StatelessWidget {
  const MoreDetailsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.arrow_back,
          color: AppColors.kprimarycolor,
          size: 20,
        ),
        SizedBox(width: 4),
        Text(
          'المزيد من التفاصيل',
          style: AppTextStyles.styleMedium14(context),
        ),
      ],
    );
  }
}
