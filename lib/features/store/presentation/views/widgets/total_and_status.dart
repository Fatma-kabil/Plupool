
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class TotalAndStatus extends StatelessWidget {
  const TotalAndStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "6000 EGP ",
          style: AppTextStyles.styleBold16(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),
        Text(
          "الإجمالي :",
          textDirection: TextDirection.rtl,
          style: AppTextStyles.styleMedium14(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),
        Spacer(),
        Text(
          "تم التسليم",
          textDirection: TextDirection.rtl,
          style: AppTextStyles.styleBold14(
            context,
          ).copyWith(color: Color(0xff05B285)),
        ),
        SizedBox(width:SizeConfig.w(4)),
        Icon(Icons.check_circle, color: Color(0xff05B285), size:SizeConfig.w(20) ),
      ],
    );
  }
}
