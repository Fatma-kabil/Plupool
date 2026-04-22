import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomerInfo extends StatelessWidget {
  const CustomerInfo({super.key, required this.name, required this.phone});
  final String name;
  final String phone;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: AppTextStyles.styleSemiBold16(context)),
        Row(
          children: [
            Text(
              textDirection: TextDirection.ltr,
             formatPhoneNumber(phone),
              style: AppTextStyles.styleMedium16(
                context,
              ).copyWith(color: AppColors.kprimarycolor),
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
