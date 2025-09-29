import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/get_badge_color.dart';
import 'package:plupool/core/utils/functions/get_badge_text.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/presentation/data/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final void Function()? onPressed;

  const ProductCard({super.key, required this.product, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final badgeText = getBadgeText(product);

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25), // rgba(0,0,0,0.25)
            offset: const Offset(1, 1), // x:1, y:1
            blurRadius: 1, // مقدار الضبابية
            spreadRadius: 0, // الانتشار
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        //   border: Border.all(color: Color(0xffAAAAAA)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min, // 👈 حل المشكلة
          //  crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  Image.asset(
                    product.image,
                    height: SizeConfig.h(101),
                    width: SizeConfig.w(151),
                    fit: BoxFit.cover,
                  ),
                  if (badgeText != null)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: getBadgeColor(product.badge),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          badgeText,
                          style: AppTextStyles.styleBold10(
                            context,
                          ).copyWith(color: Color(0xffffffff)),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              product.name,
              style: AppTextStyles.styleSemiBold14(
                context,
              ).copyWith(color: Color(0xff7B7B7B)),
            ),
            const SizedBox(height: 5),

            Row(
              children: [
                Text(
                  "${product.finalPrice.toStringAsFixed(0)}EGP",
                  style: AppTextStyles.styleBold16(
                    context,
                  ).copyWith(color: AppColors.ktextcolor),
                ),

                const SizedBox(width: 10),
                if (product.hasDiscount)
                  Text(
                    "${product.originalPrice.toStringAsFixed(0)}EGP",
                    style: AppTextStyles.styleRegular14(context).copyWith(
                      color: Color(0xff808080),
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                const SizedBox(width: 6),
              ],
            ),
            const SizedBox(height: 8),

            // 👇 زرار اضف الى السلة
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kprimarycolor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 6),
                ),
                onPressed: onPressed,
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                  size: SizeConfig.w(20),
                ),

                label: const Text(
                  "أضف إلى السلة",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
