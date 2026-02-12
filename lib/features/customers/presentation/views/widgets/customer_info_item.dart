import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomerInfoItem extends StatelessWidget {
  const CustomerInfoItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value, this.crossAxisAlignment,
  });

  final IconData icon;
  final String title;
  final String value;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment??CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: SizeConfig.w(14),
              color: AppColors.kprimarycolor,
            ),
            Text(
              " $title",
              style: AppTextStyles.styleSemiBold16(context)
                  .copyWith(color: AppColors.ktextcolor),
            ),
          ],
        ),
        SizedBox(height: SizeConfig.h(4)),
        Text(
          value,
          style: AppTextStyles.styleMedium16(context)
              .copyWith(color: const Color(0xff777777)),
        ),
      ],
    );
  }
}
