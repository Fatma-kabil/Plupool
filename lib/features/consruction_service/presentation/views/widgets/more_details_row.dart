
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

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
          size: SizeConfig.w(18),
        ),
        SizedBox(width:SizeConfig.w(4) ),
        Text(
          'المزيد من التفاصيل',
          style: AppTextStyles.styleMedium14(context),
        ),
      ],
    );
  }
}
