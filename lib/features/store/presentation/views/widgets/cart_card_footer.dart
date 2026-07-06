import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/size_config.dart';

class CartCardFooter extends StatelessWidget {
  const CartCardFooter({super.key, required this.totalItemPrice});
  final double totalItemPrice;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "الإجمالي :",
          textDirection: TextDirection.rtl,
          style: AppTextStyles.styleMedium14(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),
        Text(
          toArabicNumbers("$totalItemPrice ج.م "),
          style: AppTextStyles.styleBold16(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),
        Spacer(),
        Directionality(
          textDirection: TextDirection.rtl,
          child: TextButton(
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.delete,
                  size: SizeConfig.w(18),
                  color: Color(0xffEA5A65),
                ),
                SizedBox(width: SizeConfig.w(2)), // 👈 هنا تتحكم في المسافة
                Text(
                  "حذف",
                  style: AppTextStyles.styleBold14(
                    context,
                  ).copyWith(color: Color(0xffEA5A65)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
