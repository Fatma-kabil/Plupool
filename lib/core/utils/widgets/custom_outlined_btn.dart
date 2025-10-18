
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomOutlinedBtn extends StatelessWidget {
  const CustomOutlinedBtn({super.key, required this.text, this.width, this.trailing});
  final String text;
  final double? width;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: OutlinedButton(
        onPressed: () => Navigator.pop(context),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: AppColors.kprimarycolor),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Padding(
           padding:  EdgeInsets.symmetric(vertical: SizeConfig.h(7) ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: TextDirection.rtl,
            children: [
              Text(
                text,
                style: AppTextStyles.styleBold16(
                  context,
                ).copyWith(color: AppColors.kprimarycolor),
              ),
              if (trailing != null) ...[
                 SizedBox(width: SizeConfig.w(6) ),
                trailing!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
