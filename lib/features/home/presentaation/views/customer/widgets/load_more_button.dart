import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class LoadMoreButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LoadMoreButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColors.kprimarycolor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding:  EdgeInsets.symmetric(horizontal:SizeConfig.w(15) , vertical: SizeConfig.isWideScreen?SizeConfig.h(12):0),
      ),
      child: Text(
        "تحميل الكل",
        style: AppTextStyles.styleSemiBold16(
          context,
        ).copyWith(color: AppColors.kprimarycolor),
      ),
    );
  }
}
