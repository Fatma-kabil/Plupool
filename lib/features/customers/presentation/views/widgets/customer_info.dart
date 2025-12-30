import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomerInfo extends StatelessWidget {
  const CustomerInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "أحمد محمد",
          style: AppTextStyles.styleSemiBold16(context),
        ),
        Row(
          children: [
            Text(
              "01151234567",
              style: AppTextStyles.styleMedium16(context)
                  .copyWith(color: AppColors.kprimarycolor),
            ),
            SizedBox(width: SizeConfig.w(2)),
            Icon(
              Icons.phone,
              size: SizeConfig.w(14),
              color: AppColors.kprimarycolor,
            ),
          ],
        ),
      ],
    );
  }
}
