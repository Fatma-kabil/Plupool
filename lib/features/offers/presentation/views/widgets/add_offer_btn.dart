
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class AddOfferBtn extends StatelessWidget {
  const AddOfferBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(12),
          vertical: SizeConfig.h(8),
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.kprimarycolor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          textDirection: TextDirection.rtl,
          children: [
            Text(
              "إضافة عرض",
              style: AppTextStyles.styleMedium16(
                context,
              ).copyWith(color: AppColors.kprimarycolor),
            ),
            SizedBox(width: SizeConfig.w(4)),
            Icon(
              Icons.add_circle_outline,
              color: AppColors.kprimarycolor,
              size: SizeConfig.w(18),
            ),
          ],
        ),
      ),
    );
  }
}
