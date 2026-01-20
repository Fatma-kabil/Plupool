import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class ProductViewHeader extends StatelessWidget {
  const ProductViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'الفئات',
          style: AppTextStyles.styleBold20(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),

        GestureDetector(
          onTap: () => context.push('/addproductview'),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(10),
              vertical: SizeConfig.h(10),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.kprimarycolor,
            ),
          
            child: Row(
              children: [
                Text(
                  "إضافة منتج ",
                  style: AppTextStyles.styleMedium16(
                    context,
                  ).copyWith(color: Colors.white),
                ),
                Icon(
                  Icons.add_circle_outline,
                  color: Colors.white,
                  size: SizeConfig.w(15),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
