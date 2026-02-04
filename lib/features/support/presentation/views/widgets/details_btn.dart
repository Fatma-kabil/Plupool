
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class DetailsBtn extends StatelessWidget {
  const DetailsBtn({
    super.key,
    required this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            'تفاصيل',
            style: AppTextStyles.styleBold16(context).copyWith(
              color: AppColors.kprimarycolor,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.kprimarycolor,
            ),
          ),
          SizedBox(width: SizeConfig.w(4)),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColors.kprimarycolor,
            size: SizeConfig.w(12),
          ),
        ],
      ),
    );
  }
}
