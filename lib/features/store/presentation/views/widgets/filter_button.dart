import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class FilterButton extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback? onTap;

  const FilterButton({
    super.key,
    this.title = "تصفية",
    this.iconPath = "assets/icons/selection.svg",
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.kScaffoldColor, // background
          borderRadius: BorderRadius.circular(10), // border-radius: 10px
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25), // rgba(0,0,0,0.25)
              offset: Offset(1, 1), // 1px 1px
              blurRadius: 1, // blur
              spreadRadius: 0,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Text(
              title,
              style: AppTextStyles.styleSemiBold16(
                context,
              ).copyWith(color: AppColors.kprimarycolor),
            ),
            const SizedBox(width: 2),
            SvgPicture.asset(
              iconPath,
              width: SizeConfig.w(13),
              height: SizeConfig.h(14),
            ),
          ],
        ),
      ),
    );
  }
}
